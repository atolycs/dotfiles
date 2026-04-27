local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.initial_rows = 30
config.initial_cols = 120
config.use_ime = true

config.window_background_opacity = 0.7
config.macos_window_background_blur = 20

config.window_decorations = "RESIZE"

return config
