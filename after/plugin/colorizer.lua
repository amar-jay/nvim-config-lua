local status, colorizer = pcall(require, "colorizer")
if (not status) then
  print("Colorizer import error")
  return end


colorizer.setup({
  '*';
})

