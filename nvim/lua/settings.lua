------------------------------------------------------------
-- Aliases
------------------------------------------------------------
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

------------------------------------------------------------
-- General
------------------------------------------------------------
cmd("filetype plugin on")
cmd("filetype indent on")

g.mapleader = ","
g.maplocalleader = ","

------------------------------------------------------------
-- UI
------------------------------------------------------------
opt.hlsearch = true
opt.expandtab = true -- Use spaces instead of tabs
opt.hidden = true -- Enable background buffers
opt.ignorecase = true -- Ignore case
opt.joinspaces = false -- No double spaces with join
opt.list = true -- Show some invisible characters
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.sidescrolloff = 8 -- Columns of context
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
--opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
opt.wrap = false -- Disable line wrap

------------------------------------------------------------
-- Colors and Fonds
------------------------------------------------------------
cmd("syntax on")
cmd("colorscheme gruvbox")
opt.background = "dark"
opt.encoding = "utf8"
opt.colorcolumn = "120"

------------------------------------------------------------
-- Backups
------------------------------------------------------------
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.swapfile = false
