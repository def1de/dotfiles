#!/bin/bash

# Toggle Hyprland blur & shadow based on battery / power state.
# Enable when on external power (charging, fully-charged, pending-charge).
# Disable when actually discharging (discharging, pending-discharge).

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

enable_effects() {
  hyprctl keyword decoration:blur:enabled 1
  hyprctl keyword decoration:shadow:enabled 1
}

disable_effects() {
  hyprctl keyword decoration:blur:enabled 0
  hyprctl keyword decoration:shadow:enabled 0
}

# Treat these as "plugged / external power"
plugged_regex='^(charging|fully-charged|pending-charge)$'
# Treat these as "on battery"
battery_regex='^(discharging|pending-discharge)$'

if [[ $last_state =~ $plugged_regex ]]; then
  enable_effects
else
  disable_effects
fi

dbus-monitor --system \
  "type='signal',sender='org.freedesktop.UPower',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged'" |
while read -r line; do
  if [[ "$line" == *"$battery"* ]]; then
    current_state=$(get_battery_state)
    if [[ "$current_state" != "$last_state" ]]; then
      last_state="$current_state"
      if [[ $current_state =~ $plugged_regex ]]; then
        enable_effects
      elif [[ $current_state =~ $battery_regex ]]; then
        disable_effects
      # else: unknown / transient -> do nothing
      fi
    fi
  fi
done