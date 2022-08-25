local status, colors = pcall(require, "lsp-colors")

if (not status) then
  print("LSP colors import error!!")
  return end

colors.setup {
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#10bbbb",
  Hint = "#906fbb"
}
