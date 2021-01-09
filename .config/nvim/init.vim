" Plugin management with vim-plug
call plug#begin(stdpath('data') . '/plugged')

source $HOME/.config/nvim/vim-plug/onedark.vim
source $HOME/.config/nvim/vim-plug/oceanic-next.vim
source $HOME/.config/nvim/vim-plug/sonokai.vim
source $HOME/.config/nvim/vim-plug/edge.vim
source $HOME/.config/nvim/vim-plug/vim-which-key.vim
source $HOME/.config/nvim/vim-plug/vim-startify.vim
source $HOME/.config/nvim/vim-plug/vim-floaterm.vim
source $HOME/.config/nvim/vim-plug/vim-surround.vim
source $HOME/.config/nvim/vim-plug/vim-airline.vim
source $HOME/.config/nvim/vim-plug/vim-devicons.vim
source $HOME/.config/nvim/vim-plug/vim-fugitive.vim
source $HOME/.config/nvim/vim-plug/fzf.vim
source $HOME/.config/nvim/vim-plug/nvim-lspconfig.vim
source $HOME/.config/nvim/vim-plug/completion-nvim.vim
source $HOME/.config/nvim/vim-plug/ultisnips.vim
source $HOME/.config/nvim/vim-plug/vim-snippets.vim
source $HOME/.config/nvim/vim-plug/vim-vsnip.vim
source $HOME/.config/nvim/vim-plug/vim-vsnip-integ.vim
source $HOME/.config/nvim/vim-plug/nvim-treesitter.vim

call plug#end()

" Lua plugin configuration must be done outside the vim-plug section
lua require('my-lspconfig')
lua require('my-treesitter')

" Settings, functions, and key mappings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/general/mappings/maps.vim
source $HOME/.config/nvim/general/mappings/vim-which-key-maps.vim
