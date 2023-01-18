local status, spoon = pcall(require,"spoon");

if (not status) then
  error("Spoon cannot be import error", 1)
  return end

spoon.setup({
  preferSingleQuotes = true,
  langs = {
    all = true,
    lua = true,
    javascript = true,
    javascriptreact = true,
  },
})
