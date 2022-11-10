local status, icons = pcall(require, "nvim-web-devicons")
if (not status) then   
    print("Web-dev icons import error")
return end


icons.setup {
  -- your personnal icons can go here (to override)
  -- DevIcon will be appended to `name`
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true
}
