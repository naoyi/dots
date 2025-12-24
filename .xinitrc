#!/bin/sh

export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

systemctl --user import-environment DISPLAY

HDMI_STATUS=$(xrandr | grep "HDMI-1" | awk '{print $2}')
eDP_STATUS=$(xrandr | grep "eDP-1" | awk '{print $2}')

if [ "$HDMI_STATUS" = "connected" ]; then
    xrandr --output HDMI-1 --mode 3840x2160 --primary
    xrandr --output eDP-1 --off
else
    xrandr --output eDP-1 --auto --primary
    xrandr --output HDMI-1 --off
fi

xsetroot -solid "#000000" &
dwmblocks &
exec dwm