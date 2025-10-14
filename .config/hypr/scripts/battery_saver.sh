#!/bin/bash

battery=$(upower -e | grep battery)

# Exit if no battery is detected (desktop PC or no battery present)
if [[ -z "$battery" ]]; then
  echo "No battery detected. Exiting."
  exit 0
fi

get_battery_state() {
  upower -i "$battery" | awk '/state:/ {print $2}'
}

last_state=$(get_battery_state)

# Set blur state accordingly on startup
if [[ $last_state == "charging" ]]; then
  hyprctl keyword decoration:blur:enabled 1
else
  hyprctl keyword decoration:blur:enabled 0
fi

dbus-monitor --system "type='signal',sender='org.freedesktop.UPower',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged'" |
while read -r line; do
  if [[ "$line" == *"$battery"* ]]; then
    current_state=$(get_battery_state)
    if [[ "$current_state" != "$last_state" ]]; then
      last_state="$current_state"
      if [[ $current_state == "charging" ]]; then
        hyprctl keyword decoration:blur:enabled 1
      elif [[ $current_state == "discharging" ]]; then
        hyprctl keyword decoration:blur:enabled 0
      fi
    fi
  fi
done