#!/bin/bash

# This script suspends the system when the laptop lid is closed, but only if there is a single monitor connected.
# If multiple monitors are connected, it switches to a predefined monitor configuration instead.

# Get the number of connected hyprland monitors
monitor_count=$(hyprctl monitors -j | jq -r '.[] | .name' | wc -l)

# Check if there are 2 or more hyprland monitors connected
if [ $monitor_count -ge 2 ]; then
    cp ~/.config/hypr/monitorsh.conf ~/.config/hypr/monitors.conf
else
    systemctl suspend
    hyprlock
fi