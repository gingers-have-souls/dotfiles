# vim:foldmethod=marker

# Citing my sources {{{

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
# The X window title setting is modified from
# http://blog.pengyifan.com/how-to-set-terminal-title-dynamically-to-the-current-working-directory/

# }}}

# Just a few pieces of wisdom I had to figure out {{{

# A few of these may seem a bit obvious but after the
# numerous idiotic mistakes I made, I'm hoping that
# this helps someone avoid the same fate as me.

# 1. HISTSIZE, SAVEHIST, and HISTFILE {{{
# zsh deals with history in two ways: an internal
# history list and a history file. For this there are
# two important variables. HISTSIZE and SAVEHIST. As
# you can see below, HISTSIZE is the maximum number
# of events in the internal history list and SAVEHIST
# is the maximum number of events in the history file.
# Also of note is HISTFILE, which is the file in which
# the history is saved. In this case it is ~/.zhistory.
# }}}

# 2. When and where zsh actually saves and loads events {{{
# When zsh first opens, it loads events from the
# history file into its internal history list.
# Events in the internal history list can be accessed
# by pressing the up and down keys (in this configuration
# there's also a plugin that allows you to search through
# your internal history list for matches rather than just
# showing the previous one). Each and every instance of
# zsh has a different internal history list, but there is
# only ever one history file. How does this work? Well,
# zsh only writes to the history file when it is killed
# or closed. The option appendhistory is important
# because if you have multiple instances, then you're going
# to have different histories. The ones they had all loaded
# from the history file previously will match up and won't
# be a problem, but the more recent ones won't. When each
# instance is exited, its internal history list would
# replace the history file, and the ones from other
# instances would be erased and overwritten. appendhistory
# appends the history instead of overwriting it, allowing
# us to keep all our history even if we have multiple
# concurrent instances of zsh.
# }}}

# 3. Duplicated history events {{{
# This is the part that really messed me up.
# The setting that takes care of duplicate
# history events in this config file is
# histignorealldups. This means that if the
# command entered matches an older command
# in the history list, delete that older
# command from the history list. No matter
# how many times you press the up key,there
# will only ever be one copy of each command
# in the history list. For the history file,
# this setting is a bit strange. If you
# kill zsh by pressing mod4+q, zsh does
# not remove duplicates from the history
# file (file, not list!). However, if
# you type in "exit", it will. Other
# interesting behaviour is that setting
# SAVEHIST to 1 then killing zsh will save
# new history to the history file (without
# removing duplicates from the history file
# of course), setting SAVEHIST to 0 then
# killing the zsh will save no new history,
# but typing in "exit" for either of these
# will trim the history file to whatever
# SAVEHIST is set to (1 and 0, respectively).
# }}}

# Final notes/tl;dr: {{{
# As long as you keep in mind the difference
# between history list and history file and
# how and when each is created and/or saved,
# you'll probably avoid all the dumb stuff I did.
# Have fun configuring!
# }}}

# }}}

## Options section
#setopt correct          # Auto correct mistakes
setopt extendedglob      # Extended globbing. Allows using regular expressions with *
setopt nocaseglob        # Case insensitive globbing
setopt rcexpandparam     # Array expension with parameters
setopt nocheckjobs       # Don't warn about running processes when exiting
setopt numericglobsort   # Sort filenames numerically when it makes sense
setopt nobeep            # No beep
setopt appendhistory     # Append history to the history file instead of overwriting it, allows multiple sessions to not overwrite each other when they exit
setopt histignorealldups # If a new command in the history list (or the history file) is a duplicate, remove the older one
setopt histignorespace   # Dont't save a command to the history file if there's a space before it
setopt autocd            # if only directory path is entered, cd there

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                        # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'

HISTFILE=$HOME/.zhistory
HISTSIZE=1000000 # Max number of history events in memory/internal history list
SAVEHIST=1000000 # Max number of events in the history file
WORDCHARS=${WORDCHARS//\/[&.;]} # Don't consider certain characters part of the word

KEYTIMEOUT=1 # This helps enter vi-mode faster and is in hundreths of a second

## Keybindings section
bindkey -v                                       # That sweet sweet vi editing (press escape to enter normal mode)
bindkey "^?" backward-delete-char                # Fixes backspace not working properly after entering normal mode
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

# To be able to run things in ~/.local/bin
export PATH=$HOME/.local/bin:$PATH

## Alias section
alias cp="cp -i"      # Confirm before overwriting something
alias config='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
alias jsf='python -m json.tool'
alias ll='ls -lah --sort=size'
alias ls='ls --color'
alias n="nvim"
# Current directory size
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

# pip zsh completion start
function _pip_completion {
	local words cword
	read -Ac words
	read -cn cword
	reply=( $( COMP_WORDS="$words[*]" \
		COMP_CWORD=$(( cword-1 )) \
		PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
# pip zsh completion end

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
