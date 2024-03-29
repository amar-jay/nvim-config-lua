vim.cmd [[packadd packer.nvim]]

local status, packer = pcall(require, "packer")

if (not status) then
  print("Packer is not installed")
  return
end


packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    "amar-jay/komrade.nvim",
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-lua/plenary.nvim' -- Common utilities -- *
  use "nvim-lua/popup.nvim"  -- *

  -- Formatting & Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/nvim-cmp' -- Completion
  use "nvim-lua/lsp_extensions.nvim"

  use 'onsails/lspkind-nvim' -- vscode-like pictograms

  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'romgrk/nvim-treesitter-context'
  use("nvim-telescope/telescope.nvim")  -- *
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/lsp-colors.nvim'
  use {
  "utilyre/spoon.nvim",
  requires = { "l3mon4d3/luasnip" },
}

--  use 'L3MON4D3/LuaSnip'
--use("tzachar/cmp-tabnine", { run = "./install.sh" })
--  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
--  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
--  use 'simrat39/rust-tools.nvim' -- Rust tools install
--  use 'akinsho/nvim-bufferline.lua'
--  use 'kyazdani42/nvim-web-devicons' -- File icons
--  use 'feline-nvim/feline.nvim' -- for status bar
--  use 'lewis6991/gitsigns.nvim'
--  use 'dinhhuy258/git.nvim' -- For git blame & browse
end)

vim.cmd [[PackerInstall]]
