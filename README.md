# Dotfiles
My i3 rice.

![Screenshot](/screenshot.png)

Necessary programs (Manjaro Linux package names in no particular order):
 - zsh
 - zsh-history-substring-search
 - zsh-syntax-highlighting
 - termite
 - neovim (technically optional, but it's one of the aliases)
 - vifm (file manager)
 - python-ueberzug (images in vifm)
 - xorg-xmodmap (I remap caps lock to backspace)
 - i3-gaps
 - polybar (the nice looking thing at the top of the screen)
 - xwallpaper
 - xorg-xbacklight (for screen brightness)
 - xss-lock (screensaver that locks the screen when suspend is entered)
 - pulseaudio (for volume control)
 - rofi (application launcher and window switcher that is also used for the emoji search script)
 - ttf-bitstream-vera
 - adobe-source-code-pro-fonts (technically only used for U+2500 in the polybar but it's also a dependency of chromium)
 - Apple Color Emojis (download them off a friend's Mac then put it in /usr/share/fonts/Apple-Color-Emoji/ then run fc-cache and you should be set
 - Unicode Power Symbols (download them off https://unicodepowersymbol.com/font/ and I don't think the format matters although I used ttf, then place it in /usr/share/fonts/IEC-symbols-Unicode and run fc-cache)
 - xdotool (part of the emojisearch script (alt+e) that allows us to paste the emoji instead of just copying it to clipboard)
 - dunst (notifications)
 - picom (compositor for transparency)
