# Most of this is copied from the manjaro-zsh-config
# The vim stuff and the cursor shape stuff are
# copied from Luke Smith's void linux rice
# https://github.com/LukeSmithxyz/voidrice
# The ex function is copied from the Arch Wiki
# https://wiki.archlinux.org/index.php/Bash/Functions
# The vicd function is a combination of seebye's script from
# https://www.reddit.com/r/linux/comments/aviu08/ueberzug_v1810_released/
# and something from the vifm wiki
# https://wiki.vifm.info/index.php/How_to_set_shell_working_directory_after_leaving_Vifm

## Options section
#setopt correct          # Auto correct mistakes
setopt extendedglob      # Extended globbing. Allows using regular expressions with *
setopt nocaseglob        # Case insensitive globbing
setopt rcexpandparam     # Array expension with parameters
setopt nocheckjobs       # Don't warn about running processes when exiting
setopt numericglobsort   # Sort filenames numerically when it makes sense
setopt nobeep            # No beep
setopt appendhistory     # Immediately append history instead of overwriting
setopt histignorealldups # If a new command is a duplicate, remove the older one
setopt histexpiredupsfirst # When the history file reaches its limit, duplicates are removed first
setopt autocd            # if only directory path is entered, cd there.

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                        # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'

HISTFILE=$HOME/.zhistory
HISTSIZE=1000 # Max number of history events in internal history list
SAVEHIST=500 # Max number of history events to save in history file
export EDITOR=/usr/bin/nvim
WORDCHARS=${WORDCHARS//\/[&.;]} # Don't consider certain characters part of the word

KEYTIMEOUT=1 # This helps enter vi-mode faster and is in hundreths of a second

## Keybindings section
bindkey -v                                       # That sweet sweet vi editing (press escape to enter normal mode)
bindkey '^[[7~' beginning-of-line                # Home key
bindkey '^[[H' beginning-of-line                 # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line               # End key
bindkey '^[[F' end-of-line                # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line # [End] - Go to end of line
fi
#bindkey '^[[2~' overwrite-mode                    # Insert key
#bindkey '^[[3~' delete-char                       # Delete key
bindkey '^[[C'  forward-char                      # Right key
bindkey '^[[D'  backward-char                     # Left key
#bindkey '^[[5~' history-beginning-search-backward # Page up key
#bindkey '^[[6~' history-beginning-search-forward  # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word     #
bindkey '^[Od' backward-word    #
bindkey '^[[1;5D' backward-word #
bindkey '^[[1;5C' forward-word  #
bindkey '^H' backward-kill-word # delete previous word with ctrl+backspace
bindkey '^[[Z' undo             # Shift+tab undo last action

# The menu-select widget got loaded before in the zstyle thing but we have
# to load the module it's in to bind vim keys to it
zmodload zsh/complist
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

## Alias section 
alias cp="cp -i"      # Confirm before overwriting something
alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias jsf='python -m json.tool'
alias ll='ls -lah'
alias ls='ls --color'
alias n="nvim"
alias cdsz="du -d 1 -h"

# Theming section  
autoload -U compinit colors zcalc
compinit -d

_comp_options+=(globdots) # this includes hidden files in autocomplete and has to be after compinit for reasons I do not comprehend

colors # prompt colours don't work without this

PROMPT="%B%{$fg[cyan]%}%(3~|%-1~/../%1~|%~)%u%b %B%{$fg[cyan]%}>%b%{$fg[cyan]%}>%(?.%{$fg[white]%}.%{$fg[red]%})>%{$reset_color%} "

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

vicd() {
	# first the stuff that makes the images work
	export FIFO_UEBERZUG="/tmp/vifm-ueberzug-${PPID}"

	function cleanup {
    	rm "$FIFO_UEBERZUG" 2>/dev/null
    	pkill -P $$ 2>/dev/null
	}

	rm "$FIFO_UEBERZUG" 2>/dev/null
	mkfifo "$FIFO_UEBERZUG"
	trap cleanup EXIT
	tail --follow "$FIFO_UEBERZUG" | ueberzug layer --silent --parser bash &

	# Here's the stuff that makes it cd on quit
	local dst="$(command vifm . --choose-dir - "$@")"

	cleanup

	if [ -z "$dst" ]; then
		echo 'Directory picking cancelled/failed'
		return 1
	fi
	cd "$dst"
}

ex() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c=(bsdtar xvf);;
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}
