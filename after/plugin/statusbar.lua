--[[
local status, bar = pcall(require, "feline")
if (not status) then
  error("feline import error", 1)
  return end



--local stat, lsp = pcall(require, 'feline.providers.lsp')
--local sta, vi_mode_utils = pcall(require,'feline.providers.vi_mode')

bar.setup {
--    default_bg = colors.gray,
--    default_fg = colors.blue,
--    components = components,
--    properties = properties,
--    vi_mode_colors = vi_mode_colors
}
--]]
