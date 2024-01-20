local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end


config.color_scheme = 'Night Owl (Gogh)'

config.font = wezterm.font_with_fallback {
  { family = 'Monaspace Krypton', weight = 'Medium', harfbuzz_features = { 'ss01=0', 'ss02=0', 'ss03=0', 'ss04=0', 'ss05=0', 'ss06=0', 'ss07=0', 'ss08=0', 'calt=1', 'dlig=0' } },
  { family = 'MonaspiceKr NF',    weight = 'Medium' },
  'JetBrains Mono'
}

config.font_size = 14.0

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0',
  bottom = '0.5cell',
}
config.window_decorations = 'RESIZE'

config.default_cursor_style = 'BlinkingUnderline'

config.visual_bell = {
  fade_in_duration_ms = 50,
  fade_out_duration_ms = 50,
  target = 'CursorColor',
}

config.audible_bell = "Disabled"
config.colors = {
  visual_bell = 'red',
}

config.default_prog = { '/usr/local/bin/bash', '-l', '-c', '/usr/local/bin/tmux new-session -A -s main' }

return config
