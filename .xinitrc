#!/bin/bash

# monitor configuration
xrandr --output DP-1 --mode 2560x1440 --pos 1440x560 --rotate normal --output HDMI-1 --off --output HDMI-2 --primary --mode 2560x1440 --pos 0x0 --rotate left --output DP-1-2 --off --output DP-1-3 --off --output HDMI-1-3 --off --output DP-1-4 --off

xrdb-merge ~/.Xresources
