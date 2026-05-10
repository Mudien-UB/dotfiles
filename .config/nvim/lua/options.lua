local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmode = false

-- Tabs / indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- UX
opt.scrolloff = 8
opt.clipboard = "unnamedplus"
opt.updatetime = 200
opt.timeoutlen = 300

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Buffer / undo
opt.hidden = true
opt.undofile = true
