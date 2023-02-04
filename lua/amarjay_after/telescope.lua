local status, telescope = pcall(require, "telescope")
local t_b_status, b = pcall(require, "telescope.builtin")
local key = vim.keymap;

if (not t_b_status) then
  error("Telescope builtin import error!!", 2)
  return
end

if (not status) then
  error("Telescope module import error", 2)
  return
end

local actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  pickers = {
    theme = "dropdown",
    find_files = {
      disable_devicons = true
    },
  },
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      find_files = {
        disable_devicons = true
      },
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

local keymap = require("common.keymap").telescope
-- Setting treesitter keymaps
local function telescope_keys(builtin)
  key.set('n', keymap.find_files,
    function()
      builtin.find_files({
        no_ignore = false,
        hidden = true
      })
    end)

  key.set('n', keymap.live_grep, function()
    builtin.live_grep()
  end)

  key.set('n', keymap.buffers, function()
    builtin.buffers()
  end)

  key.set('n', keymap.help_tags, function()
    builtin.help_tags()
  end)

  key.set('n', keymap.resume, function()
    builtin.resume()
  end)

  key.set('n', keymap.diagnostics, function()
    builtin.diagnostics()
  end)

  local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
  end

  key.set("n", keymap.file_browser_less, function()
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

  key.set("n", keymap.file_browser, function()
    telescope.extensions.file_browser.file_browser({
      path = "%:p:h",
      cwd = telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      initial_mode = "normal",
      layout_config = { height = 40 }
    })
  end)
end

telescope_keys(b)
telescope.load_extension("file_browser")
