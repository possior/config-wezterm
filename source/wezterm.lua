local wezterm = require("wezterm")
local configuration = wezterm.config_builder()
local ansi_dark = {"#001100", "#007700", "#00BB00", "#007700", "#009900", "#00BB00", "#005500", "#00BB00"}
local brights_dark = {"#007700", "#007700", "#00BB00", "#007700", "#009900", "#00BB00", "#005500", "#00FF00"}
local ansi_light = {"#001100", "#007700", "#00BB00", "#007700", "#009900", "#00BB00", "#005500", "#00BB00"}
local brights_light = {"#007700", "#007700", "#00BB00", "#007700", "#009900", "#00BB00", "#005500", "#00FF00"}
configuration.automatically_reload_config = true
configuration.colors = {}
configuration.colors.ansi = ansi_dark
configuration.colors.brights = brights_dark
return configuration
