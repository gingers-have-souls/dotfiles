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
setopt autocd            # if only directory path is entered, cd there.

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                        # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500
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
