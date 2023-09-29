local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

--recommended settings from nvim tree docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
nvimtree.setup({
	renderer = {
        highlight_opened_files = "all",
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
