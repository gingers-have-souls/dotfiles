# Dotfiles

My i3 rice.

![Screenshot](/screenshot.png)

## Arch Linux packages

- zsh (use `chsh` to switch shells)
- zsh-history-substring-search
- zsh-syntax-highlighting
- zsh-completions
- termite
- vifm (terminal file manager)
- python-ueberzug (previews in vifm)
- ffmpegthumbnailer (previews in vifm)
- imagemagick (previews in vifm)
- poppler (previews in vifm)
- xorg-xmodmap (I remap caps lock to backspace)
- i3-gaps
- python-i3ipc (i3 interprocess communication, used in a few scripts)
- polybar (the nice looking thing at the top of the screen)
- xwallpaper
- xorg-xbacklight (for screen brightness)
- slock (screen locker)
- pulseaudio (for volume control)
- rofi (application launcher and window switcher, also used for the emojisearch script)
- adobe-source-code-pro-fonts (technically only used for U+2500 in the polybar)
- xdotool (allows us to fake keypresses, used in emojisearch script)
- xclip (command-line clipboard interface)
- dunst (notifications)
- picom (compositor for transparency)
- xorg-xinit (for startx, not sure why this isn't a dependency of i3)
- xorg-server (xorg base package, not sure why this isn't a dependency of i3)
- xf86-video-intel (makes the polybar backlight thing and backlight keybinds work)

## pacman command

```shell
sudo pacman -Syu zsh zsh-history-substring-search zsh-syntax-highlighting zsh-completions termite vifm ueberzug ffmpegthumbnailer poppler xorg-xmodmap i3-gaps python-i3ipc xwallpaper xorg-xbacklight slock pulseaudio rofi adobe-source-code-pro-fonts xdotool xclip dunst picom xorg-xinit xorg-server xf86-video-intel
```

## AUR packages

- neovim-git (see `$HOME/.config/nvim/init.vim` for more details on neovim setup)
- polybar (status bar)
- nerd-fonts-dejavu-complete (font of choice)
- epub-thumbnailer-git (previews in vifm)
- fontpreview-git (previews in vifm)

## yay command

```shell
yay -S neovim-git polybar nerd-fonts-dejavu-complete epub-thumbnailer-git fontpreview-git
```

## Apple Color Emojis

- Download them off a friend's Mac then put it in `/usr/share/fonts/apple-color-emoji/` then run `fc-cache`.

## How you're probably going to want to do this

The way I manage my dotfiles is with a bare git repository. From my understanding, what makes this different from a normal git repository is that the work tree (the tree in which all the files are) and the git directory (where all the git objects and stuff is stored) are different. To recreate what I have on your system, do this:

1. Create a .dotfiles.git directory in your home directory.

```shell
cd
mkdir .dotfiles.git
```

2. Make an alias so you don't have to type in the git and work directories every time. This alias is also in my .zshrc, so after you install that don't worry about making it again.

```shell
alias config='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
```

3. Now clone the repository into the .dotfiles.git folder. Remember the `--bare` flag, since that's what makes this a bare repository!

```shell
git clone --bare https://github.com/gingers-have-souls/dotfiles $HOME/.dotfiles.git
```

4. Finally, we have to actually put all the files in the right place. To do this, we update the files in the work tree by checking out. If this fails, see step 5.

```shell
config checkout
```

5. You probably just got an error message saying that files would be overwritten by checkout. Either back them up or delete them.

6. By now, you should have all the right files in all the right places. The final touch is to make sure that git only tracks the files you want it to. Otherwise, when you run `config status` it's going to show all untracked files in the work tree, which is most definitely not what you want since it's your home directory and there will end up being a lot of other junk stored there.

```shell
config config --local status.showUntrackedFiles no
```

7. To load the .zshrc you can run `source ~/.zshrc` (assuming you're already switched your shell to zsh with `chsh`), but it's probably easiest to just sign out and sign back in again. Make sure you have at least i3-gaps, nerd-fonts-dejavu-complete, xorg-xinit, and xorg-server installed, otherwise you will get an error when logging in. If that happens, press Control+alt+F2 to switch to tty2 and install the missing packages.

8. Finally, the command for updating to the most recent revision of my dotfiles.

```shell
config pull
```

9. For the neovim config you're also going to have to install vim-plug and run `:PlugInstall`, as well as a bunch of other things I have yet to document.

**[This](https://www.atlassian.com/git/tutorials/dotfiles) was really helpful to me if you want to learn more git bare repositories. This mini-guide is heavily influenced by it.**

## Disclaimer

This should work perfectly on pretty much any modern Intel laptop. On the other hand, this will not work perfectly on things that are not Intel laptops. However, as far as I can tell the only issues would be that the `xf86-video-intel` package might be unnecessary for you, that the backlight control stuff in the i3 config file and the polybar config file won't work, and that you might have to change the DPI in `.Xresources` since I'm using all this on a 4k screen.
Also, I haven't tested any of the install instructions (yet), so good luck!
