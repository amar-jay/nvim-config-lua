local lspstatus, lsp = pcall(require, "lspconfig")
-- local ruststatus, rusttools = pcall(require, "rust-tools")
local Keymaps = require("amarjay.keymap")
local config = Keymaps.lsp_keys

if (not lspstatus) then
  print("Lspconfig import error!!")
  return
end

--[[
if (not ruststatus) then
  print("Rust-Tools import error!!")
  return
end
--]]

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
lsp.ltex.setup(config({
  cmd = { "ltex-ls" },
  filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" },
  flags = { debounce_text_changes = 300 }

}))
lsp.tailwindcss.setup({})
lsp.svelte.setup(config())
lsp.grammarly.setup(config({}))
lsp.sumneko_lua.setup(config({}))

-- Rust Lsp Config
--
-- changed config to rust-tools
require("lspconfig").rust_analyzer.setup(config({
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
  --[[ settings = {
        rust = {
            unstable_features = false,
            build_on_save = false,
            all_features = true,
        },
    }
  --]]
}))
--[[
local opts = {
  tools = {
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
     -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
       on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
                require 'illuminate'.on_attach(client)
            end,
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                },
       }}
    },

} 
rusttools.setup(config(opts))
--]]

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
