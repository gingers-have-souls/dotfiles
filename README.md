# Dotfiles
My i3 rice.

![Screenshot](/screenshot.png)

## Necessary packages (Manjaro Linux package names in no particular order):
 - zsh (use `chsh` to switch shells)
 - zsh-history-substring-search
 - zsh-syntax-highlighting
 - termite
 - neovim (vim-plug is my plugin manager, see `$HOME/.config/nvim/init.vim` for more details on neovim setup)
 - vifm (file manager, type `:view` to enable previews)
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

## Necessary fonts:
 - Apple Color Emojis. Download them off a friend's Mac then put it in `/usr/share/fonts/Apple-Color-Emoji/` then run `fc-cache` and you should be set.
 - Unicode Power Symbols. Download them from [here](https://unicodepowersymbol.com/font/) and I don't think the format matters although I used ttf, then place it in `/usr/share/fonts/IEC-symbols-Unicode` and run `fc-cache`.

## Pacman command
```
sudo pacman -S zsh zsh-history-substring-search zsh-syntax-highlighting termite neovim vifm python-ueberzug xorg-xmodmap i3-gaps python-i3ipc polybar xwallpaper xorg-xbacklight xss-lock i3lock pulseaudio rofi ttf-bitstream-vera adobe-source-code-pro-fonts xdotool xclip dunst picom xorg-xinit xorg-server xf86-video-intel
```

## How you're probably going to want to do this
The way I manage my dotfiles is with a bare git repository. From my understanding, what makes this different from a normal git repository is that the work tree (the tree in which all the files are) and the git directory (where all the git objects and stuff is stored) are different. To recreate what I have on your system, do this:
1. Create a dotfiles directory in your home directory. 
```
cd
mkdir dotfiles
```
2. Make an alias so you don't have to type in the git and work directories every time. This alias is also in my .zshrc, so after you install that don't worry about making it again.
```
alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
```
3. Now clone the repository into the dotfiles folder. Remember the `--bare` flag, since that's what makes this a bare repository!
```
git clone --bare https://github.com/gingers-have-souls/dotfiles $HOME/dotfiles
```
4. Finally, we have to actually put all the files in the right place. To do this, we update the files in the work tree by checking out. If this fails, see step 5.
```
config checkout
```
5. You probably just got an error message saying that files would be overwritten by checkout. Either back them up or delete them.
6. By now, you should have all the right files in all the right places. The final touch is to make sure that git only tracks the files you want it to. Otherwise, when you run `config status` it's going to show all untracked files in the work tree, which is most definitely not what you want since it's your home directory and there will end up being a lot of other junk stored there.
```
config config --local status.showUntrackedFiles no
```
7. To load the .zshrc you can run `source ~/.zshrc` (assuming you're already switched your shell to zsh with `chsh`), but it's probably easiest to just sign out and sign back in again. Make sure you have at least i3-gaps, xorg-xinit, and xorg-server installed, otherwise you will get an error when logging in. If that happens, press Control+alt+F2 to switch to tty2 and install the missing packages.
8. Finally, the command for updating to the most recent revision of my dotfiles.
```
config pull
```
9. My neovim config takes a little bit extra to set up. See `$HOME/.config/nvim/init.vim` (neovim's config file) for more details on neovim setup. First install [vim-plug](https://github.com/junegunn/vim-plug), then install the dependencies of the plugins, then install the plugins. If you forget to install the dependencies before the plugins, there will be error messages. If this occurs, delete the plugin, fix the problem, then reinstall.

**[This](https://www.atlassian.com/git/tutorials/dotfiles) was really helpful to me if you want to learn more git bare repositories. This mini-guide is heavily influenced by it.**

## Disclaimer
This should work perfectly on pretty much any modern Intel laptop. On the other hand, this will not work perfectly on things that are not Intel laptops. However, as far as I can tell the only issues would be that the `xf86-video-intel` package might be unnecessary for you and that the backlight control stuff in the i3 config file and the polybar config file won't work. 
Also, I haven't tested any of the install instructions (yet), so good luck!
