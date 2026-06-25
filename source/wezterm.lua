local wezterm = require("wezterm")
local configuration = wezterm.config_builder()
local ansi = {"rgb(000% 000% 000%)", "rgb(000% 010% 000%)", "rgb(000% 020% 000%)", "rgb(000% 030% 000%)", "rgb(000% 040% 000%)", "rgb(000% 050% 000%)", "rgb(000% 060% 000%)", "rgb(000% 070% 000%)"}
local brights = {"rgb(000% 030% 000%)", "rgb(000% 040% 000%)", "rgb(000% 050% 000%)", "rgb(000% 060% 000%)", "rgb(000% 070% 000%)", "rgb(000% 080% 000%)", "rgb(000% 090% 000%)", "rgb(000% 100% 000%)"}
configuration.automatically_reload_config = true
configuration.colors = {}
configuration.colors.ansi = ansi
configuration.colors.brights = brights
configuration.colors.foreground = ansi[6]
configuration.colors.cursor_bg = ansi[7]
return configuration
