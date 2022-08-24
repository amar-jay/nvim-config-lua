local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then
  print("Treesitter import error!!")
  return end

ts.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "go",
    "rust"
  },
  autotag = {
    enable = true,
  },
   -- ensure_installed = "all",
   -- sync_install = false,

  }


local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

