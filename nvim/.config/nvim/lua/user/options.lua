v = vim.opt

v.clipboard = "unnamedplus"
v.cmdheight = 2
v.completeopt = { "menuone", "noselect" }
v.backup = false
v.conceallevel  = 0
v.fileencoding = "utf-8"
v.hlsearch = true
v.ignorecase = true
v.mouse = "a"
v.pumheight = 10
v.showtabline = 2
v.smartcase = true
v.smartindent = true
v.splitbelow = true
v.splitright = true
v.swapfile = false
v.termguicolors = true
v.timeoutlen = 500
v.undofile = true
v.updatetime = 300
v.writebackup = false
v.expandtab = true
v.shiftwidth = 2
v.tabstop = 2
v.cursorline = false
v.number = true
v.relativenumber = true
v.numberwidth = 4
v.signcolumn = "yes"
v.wrap = false
v.scrolloff = 8
v.sidescrolloff = 8
v.guifont = "monospace:h17"
v.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
