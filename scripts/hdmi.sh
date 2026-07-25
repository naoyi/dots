#!/bin/sh

HDMI_STATUS=$(xrandr | grep "HDMI-1" | awk '{print $2}')
NUM_MONITORS=$(xrandr --listmonitors | awk '/^Monitors:/ {print $2}')
MAX_RES=$(xrandr | awk '/^HDMI-1 connected/ {getline; print $1; exit}')

if [ "$HDMI_STATUS" = "connected" ] && [ "$NUM_MONITORS" -eq 2 ]; then
    xrandr --output HDMI-1 --mode "$MAX_RES" --primary
    xrandr --output eDP-1 --off
else
    xrandr --output eDP-1 --auto
    xrandr --output HDMI-1 --mode "$MAX_RES" --primary
fi
