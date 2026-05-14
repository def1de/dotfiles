-- #######################################################################################
--  _    __     __           _ __           ____        __
-- | |  / /__  / /___  _____(_) /___  __   / __ \____  / /______
-- | | / / _ \/ / __ \/ ___/ / __/ / / /  / / / / __ \/ __/ ___/
-- | |/ /  __/ / /_/ / /__/ / /_/ /_/ /  / /_/ / /_/ / /_(__  )
-- |___/\___/_/\____/\___/_/\__/\__, /  /_____/\____/\__/____/
--                             /____/
-- #######################################################################################
require("keybinds")
require("windowrules")

-- MONITORS
hl.monitor({
    output = "DP-4",
    mode = "highres",
    position = "0x0",
    scale = 1,
    bitdepth = 10,
})

hl.monitor({
    output = "eDP-1", -- Usually laptop monitor
    mode = "highres",
    position = "0x0",
    scale = 1,
    bitdepth = 10,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "highres",
    position = "auto-left",
    scale = 1,
    bitdepth = 10,
})

hl.monitor({
    output = "",
    mode = "highres",
    position = "auto-up",
    scale = 1,
    bitdepth = 10,
})

-- ENVIRONMENT
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("GDK_BACKEND", "wayland")

-- AUTOSTART
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper &")
    hl.exec_cmd("dunst")
    hl.exec_cmd("ashell")
    hl.exec_cmd("udiskie &")
    hl.exec_cmd("cat /dev/null/ > ~/.config/hypr/monitors.conf")
    hl.exec_cmd("kdeconnectd")
    hl.exec_cmd("dbus-update-activation-environment")
    hl.exec_cmd("~/.config/hypr/scripts/window_switcher.sh -d") -- initialize window switcher
    hl.exec_cmd("~/.config/hypr/scripts/battery_saver.sh")
end)

-- LOOK AND FEEL
hl.config({
    general = {
        -- See https://wiki.hyprland.org/Configuring/Variables/ for more
        gaps_in = 0,
        gaps_out = 0,
        border_size = 1,

        col = {
            active_border = "rgba(89b4faaa)",
            inactive_border = "rgba(00000000)",
        },

        layout = "dwindle",

        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
    },

    decoration = {
        rounding = 0,
        rounding_power = 2.0,

        blur = {
            enabled = true,
            size = 3,
            passes = 3,
        },

        shadow = {
            enabled = false,
        },
    },

    animations = {
        enabled = true,
        workspace_wraparound = true
    },
})

-- ANIMATIONS
hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("workspaces", { type = "bezier", points = { { 1, 0 }, { 0, 1 } } })
hl.curve("winIn", { type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.1 } } })
hl.curve("winOut", { type = "bezier", points = { { 0.3, -0.3 }, { 0, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 1, 1 }, { 1, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "wind", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 2, bezier = "winIn", style = "slide bottom" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, bezier = "winOut", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 1, bezier = "wind", style = "slide" })
hl.animation({ leaf = "border", enabled = false, speed = 1, bezier = "linear" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 15, bezier = "linear", style = "loop" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 0.5, bezier = "workspaces" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 2, bezier = "winIn", style = "slide bottom" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2, bezier = "winOut", style = "slide bottom" })
hl.animation({ leaf = "fadeLayersIn", enabled = false })

-- LAYOUT
hl.config({
    dwindle = {
        -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        preserve_split = true, -- you probably want this
    }
})

-- BINDS
hl.config({
    binds = {
        scroll_event_delay = 100,
        workspace_back_and_forth = true,
        hide_special_on_workspace_change = true
    },
})

-- MISC

hl.config({
    misc = {
        -- See https://wiki.hyprland.org/Configuring/Variables/ for more
        force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false,
    }
})

-- INPUT
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        numlock_by_default = true,
        follow_mouse = true,

        sensitivity = 0.4, -- -1.0 to 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.device({
    name = "glorious-model-o-wireless",
    sensitivity = -0.65,
})

hl.device({
    name = "glorious-model-o-wireless-1",
    sensitivity = -0.65,
})

hl.device({
    name = "mosart-semi.-2.4g-wireless-mouse",
    sensitivity = -1,
})
