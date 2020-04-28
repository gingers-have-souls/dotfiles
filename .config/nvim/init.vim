" Leader is space
let mapleader=" "

" Using vim-plug as a plugin manager
" https://github.com/junegunn/vim-plug

call plug#begin('~/.local/share/nvim/site/plugged')

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" run :CocInstall coc-marketplace then :CocList marketplace to list plugins

" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'
" Control-f for goyo
nnoremap <C-f> :Goyo<CR><C-l>
" Line number highlights get screwed up so reload colorscheme
function! s:goyo_leave()
	colorscheme molokai
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Colour previews
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" This plugin only works in a truecolor terminal
if $COLORTERM ==# 'truecolor' || $colorterm ==# '24bit'
	" Required to enable hexokinase colours
	set termguicolors
	" Highlights background of characters
	let g:Hexokinase_highlighters = ['background']
	" Refreshes when file is written, read, or when insert mode is exited
	let g:Hexokinase_refreshEvents = ['BufWrite', 'BufRead', 'InsertLeave']
	" Disables highlighting on .txt
	let g:Hexokinase_ftDisabled = ['text']
endif

" Git diff within Neovim
Plug 'airblade/vim-gitgutter'
autocmd BufWrite,BufRead,InsertLeave * GitGutter
command! C call ToggleEditingConfigFile()
function! ToggleEditingConfigFile()
	if g:gitgutter_git_args ==# '--git-dir=$HOME/dotfiles --work-tree=$HOME'
		let g:gitgutter_git_args = ''
		GitGutter
		echo "Not config file"
	else
		let g:gitgutter_git_args = '--git-dir=$HOME/dotfiles --work-tree=$HOME'
		GitGutter
		echo "Config file"
	endif
endfunction

" Shows recently opened files
Plug 'mhinz/vim-startify'

let g:startify_custom_header = [
\ '        __                    __           ___              ',
\ '       /\ \__                /\ \__  __  /''___\            ',
\ '   ____\ \ ,_\    __     _ __\ \ ,_\/\_\/\ \__/  __  __     ',
\ '  /'',__\\ \ \/  /''__`\  /\`''__\ \ \/\/\ \ \ ,__\/\ \/\ \ ',
\ ' /\__, `\\ \ \_/\ \L\.\_\ \ \/ \ \ \_\ \ \ \ \_/\ \ \_\ \   ',
\ ' \/\____/ \ \__\ \__/.\_\\ \_\  \ \__\\ \_\ \_\  \/`____ \  ',
\ '  \/___/   \/__/\/__/\/_/ \/_/   \/__/ \/_/\/_/   `/___/> \ ',
\ '                                                     /\___/ ',
\ '                                                     \/__/  ',
\ ]

" Automatic brackets
Plug 'cohama/lexima.vim'

" i3 config syntax highlighting
Plug 'mboughaba/i3config.vim'

call plug#end()


colorscheme molokai
set splitright
set splitbelow
set ignorecase
set mouse=a
set spelllang=en_ca
" Set tab size
set shiftwidth=4
set tabstop=4
" Line numbers
set number relativenumber

" netrw (file manager) settings
" no history
let g:netrw_dirhistmax = 0
" no banner
let g:netrw_banner = 0
" tree style listing
let g:netrw_liststyle = 3
" open in previous window
let g:netrw_browse_split = 4
" Windows opened with :Vexplore and :Hexplore are this size
let g:netrw_winsize = 20
" Close Vim if netrw is the only window
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
" Useful tip: press gn to reset the root of the directory tree

" Writing mode
function! WritingModeOn()
	setlocal spell
	setlocal linebreak
	HexokinaseTurnOff
	echo "Writing mode on"
endfunction
function! WritingModeOff()
	setlocal spell&
	setlocal linebreak&
	HexokinaseTurnOn
	echo "Writing mode off"
endfunction
function! WritingModeToggle()
	if &spell ==# "nospell"
		call WritingModeOn()
	else
		call WritingModeOff()
	endif
endfunction
command! Wm call WritingModeToggle()
command! Wmo call WritingModeOn()
command! Wmf call WritingModeOff()

" Copy to system clipboard in visual mode
vnoremap <C-c> "+y
" Clear search highlights
nnoremap <Leader>h :nohlsearch<CR><C-l>
" Exit insert mode in terminal
tnoremap <C-x> <C-\><C-n>

" Snippets
nnoremap <Leader>ct :read $HOME/.config/nvim/snippets/c.c<CR>kdd4jA
nnoremap <Leader>cppt :read $HOME/.config/nvim/snippets/cpp.cpp<CR>kdd6jA
