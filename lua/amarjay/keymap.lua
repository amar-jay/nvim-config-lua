
local key = vim.keymap
local M = {}

local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force",
        outer_opts,
        opts or {}
    )
    key.set(op, lhs, rhs, opts)
  end
end


M.nmap = bind("n", { noremap = false })
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")

-- Keymaps for tabs
key.set('n', 'te', ':tabedit ')
key.set('n', 'te<Return>', ':tabnew<Return> ')
key.set('n', '<S-Tab>', ':tabprev<Return>')
key.set('n', '<Tab>', ':tabnext<Return>')

-- Keymaps for Treesitter
local function treesitter()

local builtin = require("telescope.builtin")
local telescope = require("telescope")
key.set('n', 'nn',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', 'nr', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)
vim.keymap.set('n', '<leader>t', function()
  builtin.help_tags()
end)
vim.keymap.set('n', '<leader>r', function()
  builtin.resume()
end)
vim.keymap.set('n', '<leader>h', function()
  builtin.diagnostics()
end)

  
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end


vim.keymap.set("n", "nb", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
end

treesitter()

-- keymaps for lsp
local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			nnoremap("gd", function() vim.lsp.buf.definition() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("qws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader><leader>", function() vim.diagnostic.open_float() end)
			nnoremap("[d", function() vim.diagnostic.goto_next() end)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end)
			nnoremap("qca", function() vim.lsp.buf.code_action() end)
			nnoremap("<leader>rr", function() vim.lsp.buf.references() end)
                        nnoremap("qrn", function() vim.lsp.buf.rename() end)
                        nnoremap("qco", function() vim.lsp.buf.code_action({
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

M.config = config
return M
