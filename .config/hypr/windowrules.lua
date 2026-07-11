-- WORKSPACES
local opacity = "1.0"
local opacity_high = "1.0"

hl.window_rule({
    name = "firefox opacity",
    match = {
        class = "^(firefox)$"
    },
    opacity = opacity_high,
})

-- Opacity rules
hl.window_rule({
    name = "steam opacity high",
    match = { class = "^(Steam)$" },
    opacity = opacity_high,
})

hl.window_rule({
    name = "steam lowercase opacity high",
    match = { class = "^(steam)$" },
    opacity = opacity_high,
})

hl.window_rule({
    name = "steamwebhelper opacity",
    match = { class = "^(steamwebhelper)$" },
    opacity = opacity,
})

hl.window_rule({
    name = "spotify opacity high",
    match = { class = "^(Spotify)$" },
    opacity = opacity_high,
})

hl.window_rule({
    name = "code opacity",
    match = { class = "^(Code)$" },
    opacity = opacity,
})

hl.window_rule({
    name = "code url handler opacity",
    match = { class = "^(code-url-handler)$" },
    opacity = opacity,
})

hl.window_rule({
    name = "zed opacity",
    match = { class = "^(dev.zed.Zed)$" },
    opacity = opacity,
})

hl.window_rule({
    name = "kitty opacity",
    match = { class = "^(kitty)$" },
    opacity = "0.80 0.80",
})

hl.window_rule({
    name = "alacritty opacity",
    match = { class = "^(Alacritty)$" },
    opacity = "0.80 0.80",
})

hl.window_rule({
    name = "nwg look opacity",
    match = { class = "^(nwg-look)$" },
    opacity = opacity,
})

hl.window_rule({
    name = "qt5ct opacity",
    match = { class = "^(qt5ct)$" },
    opacity = opacity,
})

hl.window_rule({
    name = "qt6ct opacity",
    match = { class = "^(qt6ct)$" },
    opacity = opacity,
})

hl.window_rule({
    name = "kvantum manager opacity",
    match = { class = "^(kvantummanager)$" },
    opacity = opacity,
})

hl.window_rule({
    name = "protonvpn float",
    match = { class = "^(protonvpn-app)$" },
    float = true,
})

hl.window_rule({
    name = "protonvpn size",
    match = { class = "^(protonvpn-app)$" },
    size = { "auto", 500 },
})

hl.window_rule({
    name = "clapper opacity",
    match = { class = "^(com.github.rafostar.Clapper)$" },
    opacity = "0.90 0.90",
})

hl.window_rule({
    name = "flatseal opacity",
    match = { class = "^(com.github.tchx84.Flatseal)$" },
    opacity = opacity,
})

hl.window_rule({
    name = "cartridges opacity",
    match = { class = "^(hu.kramo.Cartridges)$" },
    opacity = opacity,
})

hl.window_rule({
    name = "obs opacity",
    match = { class = "^(com.obsproject.Studio)$" },
    opacity = opacity,
})

hl.window_rule({
    name = "discord opacity",
    match = { class = "^(discord)$" },
    opacity = "0.96 0.96",
})

hl.window_rule({
    name = "thunar opacity",
    match = { class = "^(thunar)$" },
    opacity = opacity,
})

hl.window_rule({
    name = "pavucontrol opacity",
    match = { class = "^(org.pulseaudio.pavucontrol)$" },
    opacity = opacity .. " 0.70",
})

hl.window_rule({
    name = "blueman manager opacity",
    match = { class = "^(blueman-manager)$" },
    opacity = opacity .. " 0.70",
})

hl.window_rule({
    name = "nm applet opacity",
    match = { class = "^(nm-applet)$" },
    opacity = opacity .. " 0.70",
})

hl.window_rule({
    name = "nm connection editor opacity",
    match = { class = "^(nm-connection-editor)$" },
    opacity = opacity .. " 0.70",
})

hl.window_rule({
    name = "polkit opacity",
    match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" },
    opacity = opacity .. " 0.70",
})

hl.window_rule({
    name = "freecad opacity",
    match = { class = "^(org.freecad.FreeCAD)$" },
    opacity = "1 1",
})

hl.window_rule({
    name = "xdg portal hyprland opacity",
    match = { class = "^(org.freedesktop.impl.portal.desktop.hyprland)$" },
    opacity = "1 1",
})

hl.window_rule({
    name = "xdg portal gtk opacity",
    match = { class = "^(org.freedesktop.impl.portal.desktop.gtk)$" },
    opacity = "1 1",
})

-- Floating rules
hl.window_rule({
    name = "kitty tile",
    match = { class = "^(kitty)$" },
    float = false,
})

hl.window_rule({
    name = "thunar float",
    match = { class = "^(thunar)$" },
    float = true,
})

hl.window_rule({
    name = "pavucontrol float",
    match = { class = "^(org.pulseaudio.pavucontrol)$" },
    float = true,
})

hl.window_rule({
    name = "spotify float",
    match = { class = "^(Spotify)$" },
    float = true,
})

hl.window_rule({
    name = "dolphin copying float",
    match = {
        class = "^(org.kde.dolphin)$",
        title = "^(Copying — Dolphin)$",
    },
    float = true,
})

hl.window_rule({
    name = "picture in picture float",
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
})

hl.window_rule({
    name = "firefox library float",
    match = {
        class = "^(firefox)$",
        title = "^(Library)$",
    },
    float = true,
})

hl.window_rule({
    name = "feh float",
    match = { class = "^(feh)$" },
    float = true,
})

hl.window_rule({
    name = "kvantum manager float",
    match = { class = "^(kvantummanager)$" },
    float = true,
})

hl.window_rule({
    name = "qt5ct float",
    match = { class = "^(qt5ct)$" },
    float = true,
})

hl.window_rule({
    name = "qt6ct float",
    match = { class = "^(qt6ct)$" },
    float = true,
})

hl.window_rule({
    name = "nwg look float",
    match = { class = "^(nwg-look)$" },
    float = true,
})

hl.window_rule({
    name = "yad float",
    match = { class = "^(yad)$" },
    float = true,
})

hl.window_rule({
    name = "pavucontrol short float",
    match = { class = "^(pavucontrol)$" },
    float = true,
})

hl.window_rule({
    name = "blueman manager float",
    match = { class = "^(blueman-manager)$" },
    float = true,
})

hl.window_rule({
    name = "nm applet float",
    match = { class = "^(nm-applet)$" },
    float = true,
})

hl.window_rule({
    name = "nm connection editor float",
    match = { class = "^(nm-connection-editor)$" },
    float = true,
})

hl.window_rule({
    name = "polkit float",
    match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" },
    float = true,
})

hl.window_rule({
    name = "learnopengl float",
    match = { title = "^(LearnOpenGL)$" },
    float = true,
})

-- Size rules
hl.window_rule({
    name = "pavucontrol size",
    match = { class = "^(org.pulseaudio.pavucontrol)$" },
    size = { 655, 667 },
})

hl.window_rule({
    name = "spotify size",
    match = { class = "^(Spotify)$" },
    size = { 1000, 620 },
})

hl.window_rule({
    name = "kitty size",
    match = { class = "^(kitty)$" },
    size = { 923, 516 },
})

hl.window_rule({
    name = "thunar size",
    match = { class = "^(thunar)$" },
    size = { 1210, 730 },
})

-- Fullscreen applications
hl.window_rule({
    name = "mpv fullscreen",
    match = { class = "^(mpv)$" },
    fullscreen_state = "2 2",
})

-- Layer rules
hl.layer_rule({
    name = "rofi ignore alpha",
    match = { namespace = "rofi" },
    ignore_alpha = 0,
})

hl.layer_rule({
    name = "notifications blur",
    match = { namespace = "notifications" },
    blur = true,
})

hl.layer_rule({
    name = "waybar no anim",
    match = { namespace = "waybar" },
    no_anim = true,
})

hl.layer_rule({
    name = "eww no anim",
    match = { namespace = "eww" },
    no_anim = true,
})

hl.layer_rule({
    name = "hyprpaper no anim",
    match = { namespace = "hyprpaper" },
    no_anim = true,
})

hl.layer_rule({
    name = "selection no anim",
    match = { namespace = "selection" },
    no_anim = true,
})

hl.layer_rule({
    name = "quickshell no anim",
    match = { namespace = "(quickshell:)[a-z]*" },
    no_anim = true,
})

hl.layer_rule({
    name = "notifications ignore alpha",
    match = { namespace = "notifications" },
    ignore_alpha = 0,
})

hl.layer_rule({
    name = "swaync notification blur",
    match = { namespace = "swaync-notification-window" },
    blur = true,
})

hl.layer_rule({
    name = "swaync notification ignore alpha",
    match = { namespace = "swaync-notification-window" },
    ignore_alpha = 0,
})

hl.layer_rule({
    name = "swaync control center blur",
    match = { namespace = "swaync-control-center" },
    blur = true,
})

hl.layer_rule({
    name = "swaync control center ignore alpha",
    match = { namespace = "swaync-control-center" },
    ignore_alpha = 0,
})

hl.layer_rule({
    name = "logout dialog blur",
    match = { namespace = "logout_dialog" },
    blur = true,
})
