#!/usr/bin/env bash

## Copyright (C) 2020-2023 Aditya Shakya <adi1090x@gmail.com>
##
## Autostart Programs

# Kill already running process
_ps=(picom dunst ksuperkey mpd xfce-polkit xfce4-power-manager)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Fix cursor
xsetroot -cursor_name left_ptr

# Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

# Enable power management
xfce4-power-manager &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Restore wallpaper
# hsetroot -root -cover ~/.config/i3/wallpapers/default.png

# Lauch notification daemon
~/.config/i3/bin/i3dunst.sh

# Lauch polybar
# ~/.config/i3/bin/i3bar.sh
$HOME/.config/polybar/launch.sh --forest

# Lauch compositor
~/.config/i3/bin/i3comp.sh

albert
mailspring &
feh --bg-scale /home/yashaswa/Pictures/wallpapers/new.jpg

