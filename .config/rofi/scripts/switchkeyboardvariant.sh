#!/bin/sh

currentlayout=$(setxkbmap -query | awk '/layout/ {print $NF}')

variants=$(echo no variant; localectl list-x11-keymap-variants $currentlayout)

variant=$(echo "$variants" | rofi -dmenu -p "Keyboard variant: " -i -theme nomodeswitcher)

if echo "$variants" | grep "^$variant$"; then
	if [ "$variant" = "no variant" ]; then
		setxkbmap $currentlayout
	else
		setxkbmap -variant $variant
	fi
	notify-send Keyboard "$variant"
	xmodmap $HOME/.Xmodmap
fi
