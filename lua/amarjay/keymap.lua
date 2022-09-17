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

-- Other keymaps
key.set('n', '<leader>vim', ':tabedit ~/.config/nvim<Return>')
key.set('n', '<leader>nvim', ':tabedit ~/.config/nvim<Return>')
key.set('n', '<leader>tmux', ':tabedit ~/.config/tmux/<Return>')

-- Keymaps for tabs
key.set('n', 'te', ':tabedit ')
key.set('n', 'te<Return>', ':tabnew<Return> ')
key.set('n', '<S-Tab>', ':tabprev<Return>')
key.set('n', '<Tab>', ':tabnext<Return>')
key.set('n', 'vs', ':vsplit' )
key.set('n', 'ss', ':split' )

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
vim.keymap.set('n', '<leader>tb', function()
  builtin.buffers()
end)
vim.keymap.set('n', '<leader>tg', function()
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


vim.keymap.set("n", "<leader>b", function()
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

-- keymaps for treesitter context 
M.ts_context = function(_setup) 
 M.nnoremap("<leader>cf", function() _setup(true) end)
 M.nnoremap("<leader>cp", function() _setup(false) end)
  end


-- keymaps for lsp
local function lsp_keys(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
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
                          }) end)
			M.inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

M.lsp_keys = lsp_keys
M.ts_context = M.ts_context
return M
