vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

--general keymaps
keymap.set("i", "jk", "<ESC>")
--snippets
keymap.set("i", "<leader>kk", "<right> =>{}<left><CR><ESC><S-o>")
keymap.set("i", "<leader>kr", "<right>")
keymap.set("i", "<leader>kf", "<right> {}<left><CR><ESC><S-o>")
keymap.set("i", "<leader>ee", "<right> if err != nil {}<left><CR><ESC><S-o><right><right>")
keymap.set("i", "<leader>ko", "<right>() =>{}<left><CR><ESC><up>$<left><left><left><left>i")
keymap.set("i", "<leader>;;", " := ")
keymap.set("i", "<leader>clg", "console.log()<left>")
--
keymap.set("n","<C-d>","<C-d>zz")
keymap.set("n","<C-u>","<C-u>zz")
keymap.set("n","<C-[>","zH")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>=", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("v","J",":m '>+1<CR>gv=gv")
keymap.set("v","K",":m '<-2<CR>gv=gv")

keymap.set("n", "<leader>sv", "<C-w>v") --split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") --split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") --make split windows queral widht
keymap.set("n", "<leader>sx", ":clos<CR>") -- close current split window
keymap.set("n", "<leader>]", ":vertical resize +10<CR>")
keymap.set("n", "<leader>[", ":vertical resize -10<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>") --open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") --close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --go  to previous tab

--plugin keymaps

--vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

--nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
vim.cmd [[augroup highlight_yank]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd TextYankPost * lua vim.highlight.on_yank({higroup='Visual', timeout=200})]]
vim.cmd [[augroup END]]
