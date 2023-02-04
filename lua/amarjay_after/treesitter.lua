local status, ts = pcall(require, "nvim-treesitter.configs")

if (not status) then
  error("Treesitter import error!!", 2)
  return
end

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
    "astro",
    "css",
    "go",
    "graphql",
    "gomod",
    "html",
    "json",
    "json5",
    "lua",
    "markdown",
    "make",
    "python",
    "regex",
    "rust",
    "tsx",
    "toml",
    "yaml",
    "vim"
  },
  autotag = {
    enable = true,
  },
  auto_installed = true,
  -- ensure_installed = "all",
   -- sync_install = false,

  }


local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

