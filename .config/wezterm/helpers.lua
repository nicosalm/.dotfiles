-- I am helpers.lua and I should live in ~/.config/wezterm/helpers.lua

local wezterm = require 'wezterm'

-- This is the module table that we will export
local module = {}

-- This function is private to this module and is not visible
-- outside.
local function private_helper()
    wezterm.log_error 'hello!'
end

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function module.apply_to_config(config)
    private_helper()

    config.window_decorations = 'RESIZE'

    config.color_scheme = 'Catppuccin Mocha'
    config.font = wezterm.font 'FiraCode Nerd Font'
    config.font_size = 17.0
    config.initial_rows = 40
    config.initial_cols = 100
    config.hide_tab_bar_if_only_one_tab = true
end

-- return our module table
return module
