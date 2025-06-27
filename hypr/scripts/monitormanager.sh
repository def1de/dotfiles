[ $(hyprctl monitors all -j | jq length) -eq 1 ] && shutdown -h now || cp /home/illia/.config/hypr/monitorsh.conf /home/illia/.config/hypr/monitors.conf
