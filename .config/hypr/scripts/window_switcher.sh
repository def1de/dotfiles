#!/bin/bash

# This adds a feature similar to Alt+Tab in Windows

update() {
    # write the current workspace and focused monitor to a temporary file
    echo "$(hyprctl -j activeworkspace | jq -r '.id')" >> /tmp/workspace_monitor
}

set_window() {
    hyprctl dispatch workspace $(tail -n 2 /tmp/workspace_monitor | head -n 1)
}

handle() {
  case $1 in
        workspacev2*)
            update ;;
  esac
}

start() {
    socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
}

# Flag -d to start in daemon mode
if [[ "$1" == "-d" ]]; then
    start
    exit 0
elif [[ "$1" == "-s" ]]; then
    set_window
    exit 0
fi