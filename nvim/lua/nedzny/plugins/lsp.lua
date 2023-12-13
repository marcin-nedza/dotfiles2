local lsp = require("lsp-zero")
local lspconfig = require('lspconfig')
local util=require('lspconfig/util')
lsp.preset("recommended")

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end



lsp.preset("recommended")
lsp.ensure_installed({
  'tsserver','gopls'
})
-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] =cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil


lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

local vim = vim

vim.lsp.set_log_level("off")
local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.filename, 'react/index.d.ts') == nil
end
local function on_list(options)
  local items = options.items
  if #items > 1 then
    items = filter(items, filterReactDTS)
  end

  vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
  vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
end
local keymap = vim.keymap
--enable keybinds for available lsp server
local on_attach = function(client, bufnr)
	-- keybind options
	-- local opts = { noremap = true, silent = true, buffer = bufnr }
-- lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  keymap.set("n", "gd", function() vim.lsp.buf.definition{on_list=on_list} end, opts)
  keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({timeout_ms=1000}) end, opts)
  keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lsp.setup()
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

vim.diagnostic.config({
    virtual_text = true
})

