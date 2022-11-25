local status, lspkind = pcall(require, "lspkind")
if (not status) then
  error("Lspkind module import error", 2)
  return end

lspkind.init({
  -- enables text annotations
  -- default = true,
  mode = true,
  ellipsis_char = '...',
  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  -- default: "default",
  -- preset = 'codicons',

  --[[
  -- override preset symbols
  symbol_map = {
    Keyword = "key",
    Snippet = "sn",
    Color = "col",
    File = "doc",
    Reference="<-",
    Folder = "fol",
    Module = "mod",
    Property = "prop",
  },
  --]]
})

