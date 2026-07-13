local wezterm = require("wezterm")
local action = wezterm.action

local configuration = wezterm.config_builder()
local ansi_dark = {"#000000", "#006300", "#006F00", "#007B00", "#008700", "#009300", "#009F00", "#00AB00"}
local brights_dark = {"#000000", "#00B700", "#00C300", "#00CF00", "#00DB00", "#00E700", "#00F300", "#00FF00"}
local ansi_light = {"#FFFFFF", "#009C00", "#009000", "#008400", "#007800", "#006C00", "#006000", "#005400"}
local brights_light = {"#FFFFFF", "#004800", "#003C00", "#003000", "#002400", "#001800", "#000C00", "#000000"}
local ansi = ansi_dark
local brights = brights_dark

configuration.automatically_reload_config = true
configuration.colors = {}
configuration.colors.ansi = ansi
configuration.colors.background = ansi[1]
configuration.colors.brights = brights
configuration.colors.cursor_bg = brights[2]
configuration.colors.cursor_border = brights[2]
configuration.colors.cursor_fg = brights[1]
configuration.colors.foreground = ansi[8]
configuration.colors.selection_bg = brights[2]
configuration.colors.selection_fg = brights[1]
configuration.font = wezterm.font_with_fallback({"Liberation Mono", "IPAexGothic", "Symbols Nerd Font Mono"})
configuration.kde_window_background_blur = true
configuration.use_ime = true
configuration.window_background_opacity = 0.8

configuration.disable_default_key_bindings = false
configuration.keys = {
    {key = "+", mods = "CTRL", action = action.IncreaseFontSize},
    {key = "-", mods = "CTRL", action = action.DecreaseFontSize},
    {key = "+", mods = "SHIFT|CTRL", action = action.IncreaseFontSize},
    {key = "-", mods = "SHIFT|CTRL", action = action.DecreaseFontSize}
}

return configuration
