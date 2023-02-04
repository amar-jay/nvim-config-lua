local status, colors = pcall(require, "lsp-colors")

if (not status) then
  error("LSP colors import error!!", 2)
  return end

colors.setup {
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#10bbbb",
  Hint = "#906fbb"
}
