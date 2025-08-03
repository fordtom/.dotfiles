-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
config.automatically_reload_config = true

config.window_padding = {
   left = 5,
   right = 0,
   top = 0,
   bottom = 0,
}

if wezterm.target_triple:find("windows") then
   config.window_padding = {
      left = 6,
      right = 6,
      top = 0,
      bottom = 0,
   }
end

-- Set the font and font size
config.font_size = 14.0
config.line_height = 1.0
config.font = wezterm.font("Berkeley Mono")

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "Catppuccin Mocha"

config.max_fps = 120
config.prefer_egl = true

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
   { key = "=", mods = "LEADER", action = wezterm.action.SplitHorizontal{ domain = "CurrentPaneDomain" } },
   { key = "-", mods = "LEADER", action = wezterm.action.SplitVertical{ domain = "CurrentPaneDomain" } },

   { key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
   { key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
   { key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
   { key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },

   { key = '1', mods = 'LEADER', action = wezterm.action.ActivateTab(0) },
   { key = '2', mods = 'LEADER', action = wezterm.action.ActivateTab(1) },
   { key = '3', mods = 'LEADER', action = wezterm.action.ActivateTab(2) },
   { key = '4', mods = 'LEADER', action = wezterm.action.ActivateTab(3) },
   { key = '5', mods = 'LEADER', action = wezterm.action.ActivateTab(4) },
   { key = '6', mods = 'LEADER', action = wezterm.action.ActivateTab(5) },
   { key = '7', mods = 'LEADER', action = wezterm.action.ActivateTab(6) },
   { key = '8', mods = 'LEADER', action = wezterm.action.ActivateTab(7) },
   { key = '9', mods = 'LEADER', action = wezterm.action.ActivateTab(8) },
}

-- and finally, return the configuration to wezterm
return config
