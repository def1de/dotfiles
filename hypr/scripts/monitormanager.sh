[ $(hyprctl monitors all -j | jq length) -eq 1 ] && shutdown -h now || cp ~/.config/hypr/monitorsh.conf ~/.config/hypr/monitors.conf
