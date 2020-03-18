#!/bin/sh

cat $HOME/.config/rofi/scripts/unicode | rofi -dmenu -p "" -i -theme emoji | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard && xdotool key "ctrl+shift+v"
