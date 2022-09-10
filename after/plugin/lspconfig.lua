local lspstatus, lsp = pcall(require, "lspconfig")
local ruststatus, rusttools = pcall(require, "rust-tools")
local Keymaps = require("amarjay.keymap")
local config = Keymaps.config

if (not lspstatus) then
  print("Lspconfig import error!!")
  return end

if (not ruststatus) then
  print("Rust-Tools import error!!")
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

lsp.tsserver.setup(config())
lsp.tailwindcss.setup({})

lsp.svelte.setup(config())

-- Rust Lsp Config
--
-- changed config to rust-tools
--[[
require("lspconfig").rust_analyzer.setup(config({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    settings = {
        rust = {
            unstable_features = false,
            build_on_save = false,
            all_features = true,
        },
    }
}))
  --]]
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
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },

} 
rusttools.setup(config(opts))

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
--[[
local status, so = pcall("symbols-outline")

if (not status) then
  print("Symbols-outlined import error!!")
  return end
so.setup(opts)
]]--

