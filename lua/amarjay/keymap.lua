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
-- Keymaps for NerdTree
key.set('n', 'nf', ':NERDTreeFocus<Return>')
key.set('n', 'nn', ':NERDTreeToggle<Return>')

return M
