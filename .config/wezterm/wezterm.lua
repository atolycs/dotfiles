local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.initial_rows = 30
config.initial_cols = 120
config.use_ime = true

-- font size
config.font_size = 12.0

config.window_background_opacity = 0.7
config.macos_window_background_blur = 20

config.window_decorations = "TITLE | RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

config.show_new_tab_button_in_tab_bar = false

--- Key Binds
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

return config
