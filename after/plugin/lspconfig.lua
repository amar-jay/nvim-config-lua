local lspstatus, lsp = pcall(require, "lspconfig")
local Keymaps = require("amarjay.keymap")
local config = Keymaps.lsp_keys

if (not lspstatus) then
  print("Lspconfig import error!!")
  return
end

lsp.pyright.setup(config())

lsp.gopls.setup(config({
  cmd = { "gopls", "serve" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}))

-- Fix config err
lsp.tsserver.setup(config({}))
lsp.ccls.setup(config({}))
lsp.tailwindcss.setup(config({
  filetypes =  { "astro", "astro-markdown", "html", "mdx", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" }
}))
lsp.svelte.setup(config())
--[[
lsp.grammarly.setup(config({
  cmd = {"grammarly-languageserver", "--stdio"},
  filetypes = {"markdown"},
  init_options = {
    clientId = "<insert client id here>"
  },
  single_file_support = true
}))
--]]
lsp.sumneko_lua.setup(config({
    settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}))

-- Rust Lsp Config
--
-- changed config to rust-tools
require("lspconfig").rust_analyzer.setup(config({
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
}))

--[[
local opts = {
	-- whether to highlight the currently hovered symbol
	-- disable if your cpu usage is higher than you want it
	-- or you just hate the highlight
	-- default: true
	highlight_hovered_item = true,

	-- whether to show outline guides
	-- default: true
	show_guides = true,
}
-- Ought to fix import error
local status, so = pcall("symbols-outline")

if (not status) then
  print("Symbols-outlined import error!!")
  return end
so.setup(opts)
--]]
