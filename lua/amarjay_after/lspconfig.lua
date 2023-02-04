local lspstatus, lsp = pcall(require, "lspconfig")
local M = require("common.keymap")

local function config(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function()
      M.inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
      M.nnoremap("gd", function() vim.lsp.buf.definition() end)
      M.nnoremap("K", function() vim.lsp.buf.hover() end)
      M.nnoremap("<leader>ws", function() vim.lsp.buf.workspace_symbol() end)
      M.nnoremap("<leader>d", function() vim.lsp.buf.type_definition() end)
      M.nnoremap("<leader>f", function() vim.diagnostic.open_float() end)
      M.nnoremap("[d", function() vim.diagnostic.goto_next() end)
      M.nnoremap("]d", function() vim.diagnostic.goto_prev() end)
      M.nnoremap("<leader>ca", function() vim.lsp.buf.code_action() end)
      M.nnoremap("<leader>rr", function() vim.lsp.buf.references() end)
      M.nnoremap("<leader>p", function() vim.lsp.buf.formatting() end)
      M.nnoremap('gr', function() vim.lsp.buf.references() end)
      M.nnoremap("<leader>rn", function() vim.lsp.buf.rename() end)
      M.nnoremap("<leader>co", function() vim.lsp.buf.code_action({
          filter = function(code_action)
            if not code_action or not code_action.data then
              return false
            end

            local data = code_action.data.id
            return string.sub(data, #data - 1, #data) == ":0"
          end,
          apply = true
        })
      end)
    end,
  }, _config or {})
end

if (not lspstatus) then
  print("Lspconfig import error!!")
  return
end

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.jsonls.setup(config({
  capabilities = capabilities,
}))

lsp.pyright.setup(config())

lsp.golangci_lint_ls.setup(config())
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
  filetypes = { "astro", "astro-markdown", "html", "mdx", "css", "javascript", "javascriptreact", "typescript",
    "typescriptreact", "svelte" }
}))
--[[
--]]
lsp.dartls.setup(config({
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" }

}))
lsp.svelte.setup(config())
lsp.grammarly.setup(config({
  -- cmd = {"grammarly-languageserver", "--stdio"},
  filetypes = { "html", "markdown", "text", "txt" },
  init_options = {
    clientId = "client_BaDkMgx4X19X9UxxYRCXZo"
  },
  --  single_file_support = true
}))

lsp.sumneko_lua.setup(config({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
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
--
