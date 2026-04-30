local wezterm = require("wezterm")
local config = wezterm.config_builder()

local dimmer = { brightness = 0.1 }
config.font = wezterm.font("FiraCode Nerd Font Mono", {
	weight = "Regular",
	stretch = "Normal",
})

local rows = 30
local cols = 120

config.automatically_reload_config = true
config.initial_rows = rows
config.initial_cols = cols
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
config.background = {
	{
		source = {
			File = os.getenv("HOME") .. "/Pictures/58839975_p0.png",
		},
		hsb = dimmer,
		-- height = rows .. "cell",
		-- width = cols .. "cell",
		-- attachment = "Fixed",
	},
}

return config
