" Using vim-plug as a plugin manager
" https://github.com/junegunn/vim-plug

call plug#begin('~/.local/share/nvim/site/plugged')

" sudo pacman -S cmake python-pynvim nodejs npm jdk8-openjdk go
Plug 'ycm-core/YouCompleteMe',  { 'do': './install.py --clangd-completer --ts-completer --java-completer --go-completer' }
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Automatically close preview window
let g:ycm_autoclose_preview_window_after_completion = 1

" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'
" Control-f for goyo
nnoremap <C-f> :silent !i3-msg fullscreen<CR>:Goyo<CR>
" Reset line number highlights when goyo exits
function! s:goyo_leave()
	highlight LineNr guifg=gray ctermfg=gray
	highlight CursorLineNr guifg=Magenta gui=NONE ctermfg=Magenta cterm=NONE
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Automatic brackets
Plug 'cohama/lexima.vim'

" i3 config syntax highlighting
Plug 'mboughaba/i3config.vim'

" This plugin only works in a truecolor terminal
let colorterm=$COLORTERM
if colorterm =~# 'truecolor' || colorterm =~# '24bit'
	" Colour previews
	" Make sure you've installed go, since it's also a dependency of this!
	Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
	" Enable hexokinase colours
	set termguicolors
	" Highlights background of characters
	let g:Hexokinase_highlighters = ['background']
	" Refreshes when file is written, read, or when insert mode is exited
	let g:Hexokinase_refreshEvents = ['BufWrite', 'BufRead', 'InsertLeave']
	" Disables highlighting on .txt
	let g:Hexokinase_ftDisabled = ['text']
endif

call plug#end()


colorscheme truecolourdefault
set encoding=utf-8
set ignorecase
set mouse=niv
" Set tab size
set shiftwidth=4
set tabstop=4
" Line numbers
set number relativenumber
highlight LineNr guifg=gray ctermfg=gray
highlight CursorLineNr guifg=Magenta gui=NONE ctermfg=Magenta cterm=NONE


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

" Copy to system clipboard in visual mode with Control+c
vnoremap <C-c> "+y

" Snippets
nnoremap ,ct :read $HOME/.config/nvim/templates/c.c<CR>kdd4jA
nnoremap ,cppt :read $HOME/.config/nvim/templates/cpp.cpp<CR>kdd6jA
