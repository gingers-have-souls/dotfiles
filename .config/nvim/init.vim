" Using vim-plug as a plugin manager
" https://github.com/junegunn/vim-plug

call plug#begin('~/.local/share/nvim/site/plugged')

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" run :CocInstall coc-marketplace then :CocList marketplace to list options

" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'
" Control-f for goyo
nnoremap <C-f> :Goyo<CR>
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

" Leader is space
let mapleader=" "
" Copy to system clipboard in visual mode
vnoremap <C-c> "+y
" Clear search highlights
nnoremap <Leader>h :nohlsearch<CR>

" Snippets
nnoremap <Leader>ct :read $HOME/.config/nvim/templates/c.c<CR>kdd4jA
nnoremap <Leader>cppt :read $HOME/.config/nvim/templates/cpp.cpp<CR>kdd6jA
