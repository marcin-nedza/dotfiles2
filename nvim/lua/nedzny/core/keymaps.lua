vim.g.mapleader = " "

local function is_next_char_right_parenthesis()
    local line = vim.fn.getline('.')
    local col = vim.fn.col('.')
    local next_char = line:sub(col, col)
    return next_char == ")"
end

local function is_next_char_right_bracket()
    local line = vim.fn.getline('.')
    local col = vim.fn.col('.')
    local next_char = line:sub(col, col)
    return next_char == "}"
end

require('go').setup()
local ls = require('luasnip')
local keymap = vim.keymap -- for conciseness
--general keymaps
keymap.set("i", "jk", "<ESC>")
--go format
keymap.set("n", "<leader>lf", function() require('go.format').goimport() end, {desc = "Format Go code"})
keymap.set("n","<leader>gr","<cmd>lua vim.lsp.buf.references()<CR>")
--go test
keymap.set("n","<leader>t","<cmd>GoTestFunc -v -n 1<CR>")

--snippets
keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
keymap.set("n","<leader><leader>s","<cmd>source ~/.config/nvim/lua/nedzny/plugins/luasnip.lua<CR>")

keymap.set("i", "<leader>kk", "<right> =>{}<left><CR><ESC><S-o>")
keymap.set("i", "<leader>kr", "<right>")
keymap.set("i", "<leader>kf", "<right> {}<left><CR><ESC><S-o>")
keymap.set("i", "<leader>ee", "<right> if err != nil {}<left><CR><ESC><S-o><right><right>")
keymap.set("i", "<leader>ef", "<right>if  err != nil {}<left><CR><up><right><right><right><right>err:=;<left>")
keymap.set("i", "<leader>ko", "<right>() =>{}<left><CR><ESC><up>$<left><left><left><left>i")
keymap.set("i", "<leader>;;", " := ")
keymap.set("i", "<leader>clg", "console.log()<left>")
keymap.set("n","<C-d>","<C-d>zz")
keymap.set("n","<C-u>","<C-u>zz")
keymap.set("n","<C-[>","zH")
keymap.set("n", "<ESC>", ":nohl<CR>")
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>=", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")
--close quickfix window
keymap.set("n","<leader>cc","<cmd> cclose<CR>")

keymap.set("v","J",":m '>+1<CR>gv=gv")
keymap.set("v","K",":m '<-2<CR>gv=gv")

keymap.set("n", "<leader>sv", "<C-w>v") --split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") --split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") --make split windows queral widht
keymap.set("n", "<leader>sx", ":clos<CR>") -- close current split window
keymap.set("n", "<leader>]", ":vertical resize +10<CR>")
keymap.set("n", "<leader>[", ":vertical resize -10<CR>")


-- keymap.set("n", "<leader>to", ":tabnew<CR>") --open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") --close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>") --go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") --go  to previous tab

--java
keymap.set("n", "<leader>jts", "<cmd>lua require('jc.jdtls').generate_toString()<CR>")
keymap.set("n", "<leader>jeq", "<cmd>lua require('jc.jdtls').generate_hashCodeAndEquals()<CR>")
keymap.set("n", "<leader>cs", "<cmd>JCgenerateAccessorSetter<CR>")
keymap.set("n", "<leader>ja", "<cmd>JCgenerateAccessors<CR>")
keymap.set("n", "<leader>jc", "<cmd>lua require('jc.jdtls').generate_constructor(nil, nil, {default = false})<CR>")
keymap.set("n", "<leader>jam", "<cmd>lua require('jc.jdtls').generate_abstractMethods()<CR>")
keymap.set("n", "<leader>jda", "<cmd>lua require('jc.vimspector').debug_attach()<CR>")
keymap.set("n","<leader>aa","<cmd>lua vim.lsp.buf.code_action()<CR>")


--vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

--nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
vim.cmd [[augroup highlight_yank]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd TextYankPost * lua vim.highlight.on_yank({higroup='Visual', timeout=200})]]
vim.cmd [[augroup END]]
--brackets and parenthesis
keymap.set("i", "ə", "=")
keymap.set("i", "ń", "{}<left>")
keymap.set("i", "µ", function()
    if is_next_char_right_bracket() then
        -- Move to the right if the next character is ")"
    vim.api.nvim_input("<right>")    
    else
        -- Insert nothing
    vim.api.nvim_feedkeys("}","n",true)    
    end
end, { noremap = true, silent = true })
keymap.set("i", "…", "()<left>")

keymap.set("i", "ł", function()
    if is_next_char_right_parenthesis() then
        -- Move to the right if the next character is ")"
    vim.api.nvim_input("<right>")    
    else
        -- Insert nothing
    vim.api.nvim_feedkeys(")","n",true)    
    end
end, { noremap = true, silent = true })
--remap backspace
keymap.set('i',"≤","<BS>")
keymap.set('i',"≥","<Del>")
