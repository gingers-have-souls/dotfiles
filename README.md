# Dotfiles
My i3 rice.

![Screenshot](/screenshot.png)

Necessary packages (Manjaro Linux package names in no particular order):
 - zsh
 - zsh-history-substring-search
 - zsh-syntax-highlighting
 - termite
 - neovim (technically optional, but it's one of the aliases)
 - vifm (file manager, type ":view" to enable previews)
 - python-ueberzug (images in vifm)
 - xorg-xmodmap (I remap caps lock to backspace)
 - i3-gaps
 - python-i3ipc (interprocess communication, allows us to do things like "fibonacci" tiling and the button that shows all windows in the scratchpad)
 - polybar (the nice looking thing at the top of the screen)
 - xwallpaper
 - xorg-xbacklight (for screen brightness)
 - xss-lock (screensaver that locks the screen when suspend is entered)
 - i3lock (screen locker)
 - pulseaudio (for volume control)
 - rofi (application launcher and window switcher that is also used for the emoji search script)
 - ttf-bitstream-vera (what the DejaVu fonts are based off of, which means it's basically identical but without any extra emojis or the like)
 - adobe-source-code-pro-fonts (technically only used for U+2500 in the polybar but it's also a dependency of chromium)
 - xdotool (part of the emojisearch script (alt+e) that allows us to paste the emoji instead of just copying it to clipboard)
 - xclip (the part of emojisearch that copies it to the clipboard before pasting it)
 - dunst (notifications)
 - picom (compositor for transparency)
 - xorg-xinit (for startx, not sure why this isn't a dependency of i3)
 - xorg-server (xorg base package, not sure why this isn't a dependency of i3)
 - xf86-video-intel (this makes the polybar backlight thing and backlight buttons work)

Necessary fonts:
 - Apple Color Emojis (download them off a friend's Mac then put it in /usr/share/fonts/Apple-Color-Emoji/ then run fc-cache and you should be set
 - Unicode Power Symbols (download them from https://unicodepowersymbol.com/font/ and I don't think the format matters although I used ttf, then place it in /usr/share/fonts/IEC-symbols-Unicode and run fc-cache)

```
sudo pacman -S zsh zsh-history-substring-search zsh-syntax-highlighting termite neovim vifm python-ueberzug xorg-xmodmap i3-gaps python-i3ipc polybar xwallpaper xorg-xbacklight xss-lock i3lock pulseaudio rofi ttf-bitstream-vera adobe-source-code-pro-fonts xdotool xclip dunst picom xorg-xinit xorg-server xf86-video-intel
```
