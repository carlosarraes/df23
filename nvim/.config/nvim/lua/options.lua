local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Tab & indents
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true
opt.showbreak = "↳  "
opt.linebreak = true

-- Wrapping
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Cursor
opt.cursorline = true

-- Appearence
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- QoL
opt.iskeyword:append("-")
opt.scrolloff = 8
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath("config") .. "~/.config/undodir"
opt.undofile = true

-- Obsidian
opt.conceallevel = 2
