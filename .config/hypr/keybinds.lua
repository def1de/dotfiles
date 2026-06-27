-- VARIABLES
local terminal = "alacritty"
local browser = "firefox"

-- KEYBINDINGS

local mainMod = "SUPER"

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/waybar.sh"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("zeditor"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + delete", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pkill rofi || ~/.config/hypr/scripts/rofi.sh"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())       -- dwindle
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + RETURN", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("cat /dev/null/ > ~/.config/hypr/monitors.conf")) -- reset 'headless' monitor configuration
hl.bind("Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"))

-- Media control
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = true })  -- toggle between media play and pause
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = true }) -- toggle between media play and pause
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, repeating = true })        -- media next
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, repeating = true })    -- media previous

-- Volume control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"), { locked = true, repeating = true }) -- increase volume
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"), { locked = true, repeating = true }) -- decrease volume
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"), { locked = true, repeating = true })          -- toggle mute

-- Brightness control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -c backlight set 10%+"),
    { locked = true, repeating = true }) -- increase brightness
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -c backlight set 10%"),
    { locked = true, repeating = true }) -- decrease brigntness

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move active window around current workspace with mainMod + SHIFT + CTRL [←→↑↓]
hl.bind(mainMod .. " + SHIFT + CONTROL + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + CONTROL + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + CONTROL + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + CONTROL + down", hl.dsp.window.move({ direction = "down" }))

-- Resize windows
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 30, y = 0 }))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -30, y = 0 }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -30 }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = -30 }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("s"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:s" }))

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_up", hl.dsp.exec_cmd("~/.config/hypr/scripts/switch_workspace.sh up"))
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.exec_cmd("~/.config/hypr/scripts/switch_workspace.sh down"))

-- Alternative way to switch workspaces with mainMod + scroll (uses built-in workspace switching)
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "m+1" }))

-- Switch between windows with ALT + TAB
hl.bind("ALT + Tab", hl.dsp.focus({ workspace = "previous_per_monitor" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Gestures
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" }) -- switch to workspaces

-- Handle lid position to shutdown or swith into "headless" mode
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("~/.config/hypr/scripts/lid.sh -- lid closed"))
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("cat /dev/null/ > ~/.config/hypr/monitors.conf")) -- lid opened
