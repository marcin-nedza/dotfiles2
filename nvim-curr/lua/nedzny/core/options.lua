local opt=vim.opt --for conciseness	 


--line numbers
opt.relativenumber=true
opt.number=true

--tabs & indentation
opt.tabstop = 4
opt.shiftwidth=4
opt.expandtab=true
opt.autoindent=true

--line wrappin
opt.wrap=false

--search settings
opt.ignorecase=true
opt.smartcase=true

--appearance
opt.termguicolors=true
opt.background="dark"

--backspace
opt.backspace="indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright=true
opt.splitbelow=true

opt.iskeyword:append("-")

