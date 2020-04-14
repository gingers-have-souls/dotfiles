" Leader is space
let mapleader=" "

" Using vim-plug as a plugin manager
" https://github.com/junegunn/vim-plug

call plug#begin('~/.local/share/nvim/site/plugged')

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" run :CocInstall coc-marketplace then :CocList marketplace to list options
" Highlight the symbol and its references
nmap <Leader>r :call CocActionAsync('highlight')<CR><C-l>

" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'
" Control-f for goyo
nnoremap <C-f> :Goyo<CR><C-l>
" Line number highlights get screwed up so reload colorscheme
function! s:goyo_leave()
	colorscheme molokai
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()

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

" Automatic brackets
Plug 'cohama/lexima.vim'

" i3 config syntax highlighting
Plug 'mboughaba/i3config.vim'

call plug#end()


colorscheme molokai
set splitright
set splitbelow
set nowrap
set encoding=utf-8
set ignorecase
set mouse=a
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

" Copy to system clipboard in visual mode
vnoremap <C-c> "+y
" Clear search highlights
nnoremap <Leader>h :nohlsearch<CR><C-l>

" Snippets
nnoremap <Leader>ct :read $HOME/.config/nvim/snippets/c.c<CR>kdd4jA
nnoremap <Leader>cppt :read $HOME/.config/nvim/snippets/cpp.cpp<CR>kdd6jA
