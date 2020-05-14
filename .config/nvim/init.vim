" Leader is space
let mapleader=' '

" Using vim-plug as a plugin manager
" https://github.com/junegunn/vim-plug

" PlugInstall and the like do a horizontal split
let g:plug_window = 'split new'

call plug#begin(stdpath('data') . '/plugged')

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" run :CocInstall coc-marketplace then :CocList marketplace to list plugins

" Git diff within Neovim
Plug 'airblade/vim-gitgutter'
autocmd BufWrite,BufRead,InsertLeave * GitGutter
command! C call ToggleEditingConfigFile()
function! ToggleEditingConfigFile()
	if g:gitgutter_git_args ==# '--git-dir=$HOME/dotfiles --work-tree=$HOME'
		let g:gitgutter_git_args = ''
		GitGutter
		echo 'Not config file'
	else
		let g:gitgutter_git_args = '--git-dir=$HOME/dotfiles --work-tree=$HOME'
		GitGutter
		echo 'Config file'
	endif
endfunction
let g:gitgutter_map_keys = 0
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)
nmap <Leader>ph <Plug>(GitGutterPreviewHunk)

" Shows recently opened files and saves session
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
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recently Opened']},
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_commands = [
    \ {'n': ['Neovim config', 'call OpenNeovimConfig()']},
    \ {'pd': ['Update plugins', 'PlugUpdate']},
    \ {'pg': ['Update vim-plug', 'PlugUpgrade']},
    \ {'ps': ['Plugin status', 'PlugStatus']},
    \ {'c': ['Update coc.nvim', 'CocUpdate']},
    \ ]
function! OpenNeovimConfig()
	e $HOME/.config/nvim/init.vim
	let g:gitgutter_git_args = '--git-dir=$HOME/dotfiles --work-tree=$HOME'
	GitGutter
endfunction

" File manager
Plug 'preservim/nerdtree'
map <C-n> :NERDTreeToggle<CR><C-l>
" Close NERDTree if it's the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Cool status line, has integration with vim-gitgutter
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
" vim airline themes
Plug 'vim-airline/vim-airline-themes'

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
" Change current directory automatically
set autochdir
" Enables 24-bit RGB if the terminal supports it
if $COLORTERM ==# 'truecolor' || $colorterm ==# '24bit'
	set termguicolors
endif


" Writing mode
command! Wm call WritingModeToggle()
command! Wmo call WritingModeOn()
command! Wmf call WritingModeOff()
function! WritingModeOn()
	setlocal spell
	setlocal linebreak
	silent CocDisable
	echo 'Writing mode on'
endfunction
function! WritingModeOff()
	setlocal spell&
	setlocal linebreak&
	CocEnable
	echo 'Writing mode off'
endfunction
function! WritingModeToggle()
	if &spell ==# 'nospell'
		call WritingModeOn()
	else
		call WritingModeOff()
	endif
endfunction

" Copy to system clipboard in visual mode
vnoremap <C-c> "+y
" Clear search highlights
nnoremap <Leader>h :nohlsearch<CR><C-l>
" Exit insert mode in terminal
tnoremap <C-x> <C-\><C-n>

" Snippets
nnoremap <Leader>ct :read $HOME/.config/nvim/snippets/c.c<CR>kdd4jA
nnoremap <Leader>cppt :read $HOME/.config/nvim/snippets/cpp.cpp<CR>kdd6jA
nnoremap <Leader>pyst gg:-1read $HOME/.config/nvim/snippets/pysh.py<CR><C-o>
