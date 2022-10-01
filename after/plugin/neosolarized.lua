local status, n = pcall(require, "komrade")
local buddy_status, cb = pcall(require, 'colorbuddy.init')
if (not status) then
  print("Theme not installed")
  return end

if (not buddy_status) then
  print("Buddy status not installed")
  return end

n.setup({
  comment_italics = true,
})
--n.setup({})

local Color = cb.Color
local Group = cb.Group

Color.new('white', '#cccccc')
Color.new('magenta', '#f000f0')
Color.new('gray', '#333333')
Group.new('Visual', cb.colors.white, cb.colors.gray, cb.styles.none)
-- Why not working??
-- Group.new('TODO', cb.colors.magenta, cb.colors.none, cb.styles.none)
