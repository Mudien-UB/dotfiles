local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tab & indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- UI
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"

-- search
opt.ignorecase = true
opt.smartcase = true

-- scrolling
opt.scrolloff = 8

-- clipboard
opt.clipboard = "unnamedplus"

-- split behavior
opt.splitright = true
opt.splitbelow = true

-- undo history
opt.undofile = true
