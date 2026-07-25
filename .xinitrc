#!/bin/sh

export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

systemctl --user import-environment DISPLAY

xrdb ~/.Xresources
xsetroot -solid "#000000" &
dwmblocks &
exec dwm
