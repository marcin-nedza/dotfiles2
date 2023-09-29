local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end
local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end
--recommended settings from nvim tree docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.opt.termguicolors = true
--vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
nvimtree.setup({
	renderer = {
        highlight_opened_files = "none",
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "ﰲ",
					arrow_open = "ﰬ",
				},
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
