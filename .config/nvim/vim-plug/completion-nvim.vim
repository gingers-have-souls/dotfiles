" Provides autocompletion
Plug 'nvim-lua/completion-nvim'

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Enable completion for UltiSnips snippets
let g:completion_enable_snippet = 'UltiSnips'

" For some reason, this puts UltiSnips lower in the completion list (which is
" what I want)
let g:completion_sorting = 'none'
