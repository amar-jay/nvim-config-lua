local status, packer = pcall(require, "packer")

if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- TJ Packages
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-lua/plenary.nvim' -- Common utilities -- *
  use("nvim-lua/popup.nvim") -- *

  -- Formatting & Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'simrat39/symbols-outline.nvim'
  --  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use 'simrat39/rust-tools.nvim' -- Rust tools install

  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'romgrk/nvim-treesitter-context'
 -- use 'kyazdani42/nvim-web-devicons' -- File icons
  use("nvim-telescope/telescope.nvim")  -- *
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/lsp-colors.nvim'
 use 'akinsho/nvim-bufferline.lua'
  -- Ought to purchase first
 -- use 'github/copilot.vim'

--  use 'lewis6991/gitsigns.nvim'
--  use 'dinhhuy258/git.nvim' -- For git blame & browse
end)

