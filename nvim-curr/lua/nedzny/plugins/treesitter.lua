-- -- import nvim-treesitter plugin safely
-- local status, treesitter = pcall(require, "nvim-treesitter.configs")
-- if not status then
-- 	return
-- end
--
-- -- configure treesitter
-- treesitter.setup({
-- 	-- enable syntax highlighting
-- 	highlight = {
-- 		enabled = true,
-- 	},
-- 	-- enable indentation
-- 	indent = { enable = true },
-- 	-- enable autotagging (w/ nvim-ts-autotag plugin)
-- 	autotag = { enable = true },
-- 	-- ensure these language parsers are installed
-- 	ensure_installed = {
-- 		"json",
-- 		"javascript",
-- 		"typescript",
-- 		"tsx",
-- 		"yaml",
-- 		"html",
-- 		"css",
-- 		"markdown",
-- 		"graphql",
-- 		"bash",
-- 		"lua",
-- 		"vim",
-- 		"dockerfile",
-- 		"gitignore",
-- 	},
-- 	-- auto install above language parsers
-- 	auto_install = true,
-- })
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {"javascript", "typescript", "c_sharp", "lua", "rust","html","css" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
