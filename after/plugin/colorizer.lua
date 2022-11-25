local status, colorizer = pcall(require, "colorizer")
if (not status) then
  error("Colorizer import error", 1)
  return end


colorizer.setup({
  '*';
})

