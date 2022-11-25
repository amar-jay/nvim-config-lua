local status, n = pcall(require, "komrade")
local buddy_status, cb = pcall(require, 'colorbuddy.init')
if (not status) then
  error("Theme not installed", 1)
  return end

if (not buddy_status) then
  error("Buddy status not installed", 1)
  return end

n.setup({
  comment_italics = true,
  default_theme = "dark",
  todo_bold = false

})
--n.setup({})

local Color = cb.Color
local Group = cb.Group


Color.new('white', '#cccccc')
Color.new('gray', '#333333')
Group.new('Visual', cb.colors.white, cb.colors.gray, cb.styles.none)
