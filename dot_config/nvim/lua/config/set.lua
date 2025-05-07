-- set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set only if nerd font is used
vim.g.have_nerd_font = true

-- show line and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- shown in 
-- vim.opt.showmode = false

-- separate concerns between nvim and system
vim.opt.clipboard = "unnamedplus"

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- enable sign column
vim.opt.signcolumn = "yes:1"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

-- split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- enable showing substitutions
vim.opt.inccommand = "split"

-- show line cursor is on
vim.opt.cursorline = true

-- line to keep above and below cursor
vim.opt.scrolloff = 5

-- highlight on search
vim.opt.hlsearch = true
