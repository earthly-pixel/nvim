
local opt = vim.opt

--Line Numbers
opt.number = true
opt.relativenumber = true

--Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

--Search Settings
opt.ignorecase = true
opt.smartcase = true

--Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true

--Behavior
opt.clipboard:append("unnamedplus") 	--Use system clipboard
opt.splitright = true 			--Vertical splits open to the right
opt.splitbelow = true			--Horizontal splits open below
opt.undofile = true			--Save undo history to file
