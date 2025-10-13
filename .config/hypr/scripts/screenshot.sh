#!/bin/bash

# Select area
area=$(slurp -d)
[ -z "$area" ] && exit 1  # Exit if selection was canceled

# Create screenshots directory if it doesn't exist
mkdir -p ~/Pictures/screenshots

# Format timestamp
timestamp=$(date +"%d%m%Y-%H%M")
filepath=~/Pictures/screenshots/"$timestamp".png

# Take screenshot, save to file and pipe to wl-copy
grim -g "$area" "$filepath" && wl-copy < "$filepath"