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

key.set('n', 'te', ':tabedit ')
key.set('n', '<S-Tab>', ':tabprev<Return>')
key.set('n', '<Tab>', ':tabnext<Return>')

-- Keymaps for Treesitter
local function treesitter()

local builtin = require("telescope.builtin")
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
vim.keymap.set('n', 'nt', function()
  builtin.help_tags()
end)
vim.keymap.set('n', 'nc', function()
  builtin.resume()
end)
vim.keymap.set('n', 'ne', function()
  builtin.diagnostics()
end)
  --[[
  -- TODO: Setup filebrowser 
vim.keymap.set("n", "sf", function()
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
    ]]--
end

treesitter()
return M
