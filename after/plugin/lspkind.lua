local status, lspkind = pcall(require, "lspkind")
if (not status) then return end

lspkind.init({
  -- enables text annotations
  -- default = true,
  mode = true,
  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  -- default: "default",
  -- preset = 'codicons',

  -- override preset symbols
  symbol_map = {
    Keyword = "📨",
    Snippet = "ss",
    Color = "❄️",
    File = "📂",
    Reference="↻",
    Folder = "📂",
    Module = "",
    Property = "ﰠ",
  },
})

