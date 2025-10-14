#!/bin/bash

# This script allows switching between workspaces on the focused monitor only.

# Get the active workspace on the focused monitor
current_workspace=$(hyprctl monitors | grep "focused: yes" -B 11 | grep "active workspace" | awk '{print $3}')

# Get the monitor ID of the focused monitor
monitor_id=$(hyprctl monitors | grep "focused: yes" -B 11 | grep -oP '(?<=ID )\d+')

# Get all valid workspaces assigned to this monitor
valid_workspaces=($(hyprctl workspaces | grep "monitorID: $monitor_id" -B 1 | grep -oP '(?<=ID )\d+'))

# Sort workspaces numerically (to ensure correct order)
IFS=$'\n' valid_workspaces=($(sort -n <<<"${valid_workspaces[*]}"))
unset IFS

# Determine whether to switch up or down
direction=$1  # "up" or "down"

# Find the index of the current workspace in the list
for i in "${!valid_workspaces[@]}"; do
    if [[ "${valid_workspaces[$i]}" == "$current_workspace" ]]; then
        current_index=$i
        break
    fi
done

# Determine the next workspace to switch to, with clamping
if [[ "$direction" == "up" ]]; then
    if [[ $current_index -lt $((${#valid_workspaces[@]} - 1)) ]]; then
        new_index=$((current_index + 1))
    else
        exit 0
    fi
else
    if [[ $current_index -gt 0 ]]; then
        new_index=$((current_index - 1))
    else
        exit 0  # Do nothing if at the first workspace
    fi
fi

# Switch to the determined workspace
hyprctl dispatch workspace "${valid_workspaces[$new_index]}"