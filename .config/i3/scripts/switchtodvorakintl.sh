#!/bin/sh
notify-send Keyboard dvorak-intl
setxkbmap -variant dvorak-intl
xmodmap ~/.Xmodmap
