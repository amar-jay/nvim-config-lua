local ok, km = pcall(require, 'common.keymap')
if (not ok) then
  error("Kickstart keymap import error", 1)
  return
end

-- Telescope keymaps
local keymap = km.telescope

-- Enable telescope fzf native, if installed
local telescope = require('telescope')
local builtin = require('telescope.builtin')
pcall(require('telescope').load_extension, 'fzf')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

-- See `:help telescope.builtin`
vim.keymap.set('n', keymap.old_files, builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', keymap.buffers, builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', keymap.fuzzy_find, function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', keymap.find_files,
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)

vim.keymap.set("n", keymap.file_browser_less, function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    initial_mode = "normal",
    layout_config = { height = 30 }
  })
end)

vim.keymap.set("n", keymap.file_browser, function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = true,
    previewer = true,
    hidden = true,
    grouped = true,
    initial_mode = "normal",
    layout_config = { height = 30 }
  })
end)
--vim.keymap.set('n', keymap.find_files, builtin.find_files, { 
--  desc = '[S]earch [F]iles', 
--  no_ignore = false,
--  hidden = true
--})
vim.keymap.set('n', keymap.help_tags, builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', keymap.grep_string, builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', keymap.live_grep, builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', keymap.diagnostics, builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

