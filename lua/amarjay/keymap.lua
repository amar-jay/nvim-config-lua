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

-- Keymaps for split
key.set('n', '<leader>|', ':vsplit' )
key.set('n', '<leader>_', ':split' )
key.set('n', '<leader><Space>', '<C-W>w')
key.set('n', '<leader><up>', '<C-w>k' )
key.set('n', '<leader><down>', '<C-w>j' )
key.set('n', '<leader><left>', '<C-w>h' )
key.set('n', '<leader><right>', '<C-w>l' )
key.set('n', '<leader><S-up>', '<C-w>+' )
key.set('n', '<leader><S-down>', '<C-w>-' )
key.set('n', '<leader><S-left>', '<C-w><' )
key.set('n', '<leader><S-right>', '<C-w>>' )

-- Keymaps for Git 
key.set("n", "<leader>gs", vim.cmd.Git);



-- keymaps for treesitter context 
M.ts_context = function(_setup)
 M.nnoremap("<leader>cf", function() _setup(true) end)
 M.nnoremap("<leader>cp", function() _setup(false) end)
  end


-- keymaps for lsp
M.ts_context = M.ts_context
return M
