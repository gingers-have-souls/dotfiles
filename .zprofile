if systemctl -q is-active graphical.target && [[ "$(tty)" = "/dev/tty2" ]]; then
  exec startx ~/.xinitrcbspwm
fi
if systemctl -q is-active graphical.target && [[ "$(tty)" = "/dev/tty1" ]]; then
  exec startx ~/.xinitrc
fi
