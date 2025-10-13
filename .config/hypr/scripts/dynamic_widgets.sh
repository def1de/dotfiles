#!/bin/bash
hyprctl dispatch exec "/home/$(whoami)/.config/hypr/scripts/desktop_widget"

event(){
    ACTIVE_WORKSPACE=$(hyprctl activeworkspace -j)
    WINDOWS=$(echo "$ACTIVE_WORKSPACE" | jq -r '.windows')

    if [ "$WINDOWS" -eq 0 ]; then

        hyprctl dispatch exec "/home/$(whoami)/.config/hypr/scripts/desktop_widget"
    else
        pkill desktop_widget
    fi
}

handle() {
  case $1 in
        workspacev2*)
            event ;;
        focusedmonv2*)
            event ;;
        openwindow*)
            event ;;
        closewindow*)
            event ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done