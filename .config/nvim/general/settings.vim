colorscheme sonokai
hi LspReferenceText cterm=underline,bold gui=underline,bold
hi LspReferenceRead cterm=underline,bold gui=underline,bold
hi LspReferenceWrite cterm=underline,bold gui=underline,bold

if $TERM =~# 'xterm' || $TERM =~# '256color' || $TERM =~# 'alacritty'
	set termguicolors
endif
set splitright
set splitbelow
set ignorecase
set mouse=a
set title
set spelllang=en_ca
set number relativenumber
set autochdir
set tabstop=4
set shiftwidth=4
