local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.enable_tab_bar = false
config.default_cursor_style = "BlinkingUnderline"
config.color_scheme = "Catppuccin Mocha"

config.window_background_opacity = 0.90
config.macos_window_background_blur = 25
config.window_frame = {
	border_left_width = "0.5cell",
	border_right_width = "0.5cell",
	border_bottom_height = 0,
	border_top_height = 0,
}

config.window_padding = {
	left = 0,
	right = 0,
	top = "0.5cell",
	bottom = 0,
}

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13.0

return config
