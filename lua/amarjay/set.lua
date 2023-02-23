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
vim.opt.cmdheight = 1 -- Give more space for displaying messages. 
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.shiftwidth = 4

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true -- case insensitive unless /C
vim.opt.smartcase = true

vim.opt.wrap = false
vim.opt.backspace = { 'start', 'eol', 'indent'}
vim.opt.swapfile = false
vim.opt.path:append { '**' } -- In finding files
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'
vim.opt.signcolumn = "yes"
--vim.opt.isfname:append("@-@")

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 250

--vim.opt.colorcolumn = "800"
vim.g.mapleader = " " -- Set Leader

-- Do not pass emssage to |ins-completion-menu|
--vim.opt.shortmess:append("c") -- Doesn't work anymore
--vim.opt.iskeyword:append {"c"}

--vim.opt.clipboard = 'unnamed'
--vim.opt.clipboard = 'unnamedplus'

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
