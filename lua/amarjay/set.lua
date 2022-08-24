-- basic vim configs --

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.nu = true
vim.opt.relativenumber = true -- show line number relative to cursor

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.errorbells = false
vim.opt.showcmd = true
vim.opt.backup = false -- No backup of files
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 8
vim.opt.shell = 'neovim'
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.ignorecase = true -- case insensitive unless /C
vim.opt.wrap = false
-- vim.opt.backspace = { 'start', 'eol', 'indent'}
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.path:append { '**' } -- In finding files
vim.opt.cmdheight = 1 -- Give more space for displaying messages. 

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- TODO: Set Leader
