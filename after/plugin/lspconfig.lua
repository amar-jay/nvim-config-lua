local status, lsp = pcall(require, "lspconfig")
local Remap = require("amarjay.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

if (not status) then
  print("Lspconfig import error!!")
  return end

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			nnoremap("gd", function() vim.lsp.buf.definition() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			nnoremap("[d", function() vim.diagnostic.goto_next() end)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end)
			nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
			nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
                        nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
                        nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
                              filter = function(code_action)
                                  if not code_action or not code_action.data then
                                      return false
                                  end

                                  local data = code_action.data.id
                                  return string.sub(data, #data - 1, #data) == ":0"
                              end,
                              apply = true
                          }) end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
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
local s, rusttools = pcall(require, "rust-tools")

if (not s) then
  print("Rust-Tools import error!!")
  return
end
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

--[[
-- Ought to fix import error
local status, so = pcall("symbols-outline")

if (not status) then
  print("Symbols-outlined import error!!")
  return end

so.setup(opts)
]]--


-- Mason LSP Config
local status, masonconfig = pcall(require, "mason-lspconfig")
if (not status) then 
  print("Mason LspConfig Error")
  return end

masonconfig.setup {
  ensure_installed = { "sumneko_lua", "tailwindcss" },
}
