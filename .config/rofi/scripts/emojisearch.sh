#!/bin/sh

cat $HOME/.config/rofi/scripts/unicode | rofi -dmenu -p "" -i -font 'Apple color emoji 20' | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard && xdotool key "ctrl+shift+v"
