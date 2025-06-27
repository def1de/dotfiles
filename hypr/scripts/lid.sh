#!/bin/bash

# Get the number of connected hyprland monitors
monitor_count=$(hyprctl monitors -j | jq -r '.[] | .name' | wc -l)

# Check if there are 2 or more hyprland monitors connected
if [ $monitor_count -ge 2 ]; then
    cp /home/illia/.config/hypr/monitorsh.conf /home/illia/.config/hypr/monitors.conf
    pkill eww
    eww daemon
    eww open clock
else
    systemctl suspend
    hyprlock
fi