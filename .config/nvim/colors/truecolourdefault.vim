" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
set bg&

" Remove all existing highlighting and set the defaults.
highlight clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "truecolourdefault"

hi SpecialKey           ctermfg=81 guifg=#5fafff
hi TermCursor           cterm=reverse gui=reverse
hi NonText              ctermfg=12 guifg=#0000ff
hi Directory            ctermfg=159 guifg=#afffff
hi ErrorMsg             ctermfg=15 ctermbg=1 guifg=#ffffff guibg=#800000
hi IncSearch            cterm=reverse gui=reverse
hi Search               ctermfg=0 ctermbg=11 guifg=#000000 guibg=#ffff00
hi MoreMsg              ctermfg=121 guifg=#87ffaf
hi ModeMsg              cterm=bold gui=bold
hi LineNr               ctermfg=11 guifg=#ffff00
hi CursorLineNr         ctermfg=11 guifg=#ffff00
hi Question             ctermfg=121 guifg=#87ffaf
hi StatusLine           cterm=bold,reverse gui=bold,reverse
hi StatusLineNC         cterm=reverse gui=reverse
hi VertSplit            cterm=reverse gui=reverse
hi Title                ctermfg=225 guifg=#ffd7ff
hi Visual               ctermbg=242 guibg=#6c6c6c
hi WarningMsg           ctermfg=224 guifg=#ffd7d7
hi WildMenu             ctermfg=0 ctermbg=11 guifg=#000000 guibg=#ffff00
hi Folded               ctermfg=14 ctermbg=242 guifg=#00ffff guibg=#6c6c6c
hi FoldColumn           ctermfg=14 ctermbg=242 guifg=#00ffff guibg=#6c6c6c
hi DiffAdd              ctermbg=4 guibg=#000080
hi DiffChange           ctermbg=5 guibg=#800080
hi DiffDelete           ctermfg=12 ctermbg=6 guifg=#0000ff guibg=#008080
hi DiffText             cterm=bold ctermbg=9 guibg=#ff0000
hi SignColumn           ctermfg=14 ctermbg=242 guifg=#00ffff guibg=#6c6c6c
hi Conceal              ctermfg=7 ctermbg=242 guifg=#c0c0c0 guibg=#6c6c6c
hi SpellBad             ctermbg=9 gui=undercurl guisp=#ff0000
hi SpellCap             ctermbg=12 gui=undercurl guisp=#0000ff
hi SpellRare            ctermbg=13 gui=undercurl guisp=#ff00ff
hi SpellLocal           ctermbg=14 gui=undercurl guisp=#00ffff
hi Pmenu                ctermfg=0 ctermbg=13 guifg=#000000 guibg=#ff00ff
hi PmenuSel             ctermfg=242 ctermbg=0 guifg=#6c6c6c guibg=#000000
hi PmenuSbar            ctermbg=248 guibg=#a8a8a8
hi PmenuThumb           ctermbg=15 guibg=#ffffff
hi TabLine              cterm=underline ctermfg=15 ctermbg=242 gui=underline guifg=#ffffff guibg=#6c6c6c
hi TabLineSel           cterm=bold gui=bold
hi TabLineFill          cterm=reverse gui=reverse
hi CursorColumn         ctermbg=242 guibg=#6c6c6c
hi CursorLine           cterm=underline gui=underline
hi ColorColumn          ctermbg=1 guibg=#800000
hi RedrawDebugNormal    cterm=reverse gui=reverse
hi RedrawDebugClear     ctermbg=11 guibg=#ffff00
hi RedrawDebugComposed  ctermbg=10 guibg=#00ff00
hi RedrawDebugRecompose ctermbg=9 guibg=#ff0000
hi MatchParen           ctermbg=6 guibg=#008080
hi NvimInternalError    ctermfg=9 ctermbg=9 guifg=#ff0000 guibg=#ff0000
hi Identifier           cterm=bold ctermfg=14 guifg=#00ffff
hi Type                 ctermfg=121 guifg=#87ffaf
hi Error                ctermfg=15 ctermbg=9 guifg=#ffffff guibg=#ff0000
hi Comment              ctermfg=14 guifg=#00ffff
hi Constant             ctermfg=13 guifg=#ff00ff
hi Special              ctermfg=224 guifg=#ffd7d7
hi Statement            ctermfg=11 guifg=#ffff00
hi PreProc              ctermfg=81 guifg=#5fd7ff
hi Underlined           cterm=underline ctermfg=81 gui=underline guifg=#5fd7ff
hi Ignore               ctermfg=0 guifg=#000000
hi Todo                 ctermfg=0 ctermbg=11 guifg=#000000 guibg=#ffff00
