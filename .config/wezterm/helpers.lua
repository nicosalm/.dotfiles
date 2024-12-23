local wezterm = require 'wezterm'

-- This is the module table that we will export
local module = {}

-- Create an alias for wezterm.action to make the config more concise
local act = wezterm.action

-- Function to check if the current pane is running Vim
local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == 'true'
end

-- Direction keys mapping for split navigation
local direction_keys = {
  Left = 'h',
  Down = 'j',
  Up = 'k',
  Right = 'l',
  -- reverse lookup
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

-- Helper function for split navigation and resizing
local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'META' or 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

-- This function is private to this module
local function private_helper()
    wezterm.log_error 'hello!'
end

-- Main configuration function
function module.apply_to_config(config)
    private_helper()

    -- Basic configuration
    config.window_decorations = 'RESIZE'
    -- config.color_scheme = 'Elementary (Gogh)'
    -- config.color_scheme = 'Catppuccin Mocha'
    -- config.color_scheme = 'Gruvbox dark, hard (base16)'
    config.color_scheme = 'Tango (terminal.sexy)'
    -- config.color_scheme = 'Tango (base16)'
    config.font = wezterm.font 'FiraCode Nerd Font'
    config.font_size = 17.0
    config.initial_rows = 40
    config.initial_cols = 100
    config.hide_tab_bar_if_only_one_tab = true

    -- Leader configuration
    config.leader = {
        key = 'Space',
        mods = 'CTRL',
        timeout_milliseconds = 1000
    }

    -- Key bindings
    config.keys = {
        -- Splitting panes
        {
            mods = "LEADER",
            key = "-",
            action = act.SplitVertical { domain = 'CurrentPaneDomain' }
        },
        {
            mods = "LEADER",
            key = "=",
            action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
        },

        -- Pane management
        {
            mods = 'LEADER',
            key = 'm',
            action = act.TogglePaneZoomState
        },
        {
            mods = "LEADER",
            key = "Space",
            action = act.RotatePanes "Clockwise"
        },
        {
            mods = 'LEADER',
            key = '0',
            action = act.PaneSelect {
                mode = 'SwapWithActive',
            },
        },

        -- Copy mode
        {
            key = 'Enter',
            mods = 'LEADER',
            action = act.ActivateCopyMode
        },

        -- Split navigation
        split_nav('move', 'h'),
        split_nav('move', 'j'),
        split_nav('move', 'k'),
        split_nav('move', 'l'),

        -- Split resizing
        split_nav('resize', 'h'),
        split_nav('resize', 'j'),
        split_nav('resize', 'k'),
        split_nav('resize', 'l'),
    }
end

return module
