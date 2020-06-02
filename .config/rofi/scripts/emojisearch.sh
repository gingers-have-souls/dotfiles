#!/bin/sh

(cat $HOME/.config/rofi/scripts/customsymbols; sed 's/\t/ | /g' $HOME/.config/rofi/scripts/emoji-data/data/all_emojis.txt; cat $HOME/.config/rofi/scripts/nerdfontsymbols) | rofi -dmenu -p "" -i -theme thicc | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard && xdotool key "ctrl+shift+v"
