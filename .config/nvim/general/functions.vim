" Writing mode
function! WritingModeToggle()
	if &spell ==# 'nospell'
		setlocal spell
		setlocal linebreak
		nmap j gj
		nmap <DOWN> gj
		nmap k gk
		nmap <UP> gk
		echo 'Writing mode on'
	else
		setlocal spell&
		setlocal linebreak&
		nmap j j
		nmap <DOWN> j
		nmap k k
		nmap <UP> k
		echo 'Writing mode off'
	endif
endfunction

" LSP functions called in vim-which-key
" vim-which-key doesn't work if these are called directly in its mappings, and
" turning them into functions is the workaround
" Wrapping these with feedkeys() also works, but is uglier
function! LSPBufGetClients()
	lua print(vim.inspect(vim.lsp.buf_get_clients()))
endfunction
function! LSPForceReload()
	lua vim.lsp.stop_client(vim.lsp.get_active_clients())
	edit
endfunction
function! LSPCodeAction()
	lua vim.lsp.buf.code_action()
endfunction
function! LSPJumpToDeclaration()
	lua vim.lsp.buf.declaration()
endfunction
function! LSPJumpToDefinition()
	lua vim.lsp.buf.definition()
endfunction
function! LSPDocumentHighlight()
	lua vim.lsp.buf.document_highlight()
endfunction
function! LSPDocumentSymbols()
	lua vim.lsp.buf.document_symbol()
endfunction
function! LSPFormatting()
	lua vim.lsp.buf.formatting()
endfunction
function! LSPHover()
	lua vim.lsp.buf.hover()
endfunction
function! LSPImplementation()
	lua vim.lsp.buf.implementation()
endfunction
function! LSPIncomingCalls()
	lua vim.lsp.buf.incoming_calls()
endfunction
function! LSPOutgoingCalls()
	lua vim.lsp.buf.outgoing_calls()
endfunction
function! LSPReferences()
	lua vim.lsp.buf.references()
endfunction
function! LSPRename()
	lua vim.lsp.buf.rename()
endfunction
function! LSPTypeDefinition()
	lua vim.lsp.buf.type_definition()
endfunction
function! LSPWorkspaceSymbol()
	lua vim.lsp.buf.workspace_symbol()
endfunction
function! LSPDiagnosticGotoNext()
	lua vim.lsp.diagnostic.goto_next({wrap = false})
endfunction
function! LSPDiagnosticGotoPrev()
	lua vim.lsp.diagnostic.goto_prev({wrap = false})
endfunction
function! LSPDiagnosticSetLoclist()
	lua vim.lsp.diagnostic.set_loclist()
endfunction

" Taken from https://vim.fandom.com/wiki/Move_current_window_between_tabs
" Very nifty
function MoveToPrevTab()
	"there is only one window
	if tabpagenr('$') == 1 && winnr('$') == 1
		return
	endif
	"preparing new window
	let l:tab_nr = tabpagenr('$')
	let l:cur_buf = bufnr('%')
	if tabpagenr() != 1
		close!
		if l:tab_nr == tabpagenr('$')
			tabprev
		endif
		sp
	else
		close!
		exe "0tabnew"
	endif
	"opening current buffer in new window
	exe "b".l:cur_buf
endfunc
function MoveToNextTab()
	"there is only one window
	if tabpagenr('$') == 1 && winnr('$') == 1
		return
	endif
	"preparing new window
	let l:tab_nr = tabpagenr('$')
	let l:cur_buf = bufnr('%')
	if tabpagenr() < tab_nr
		close!
		if l:tab_nr == tabpagenr('$')
			tabnext
		endif
		sp
	else
		close!
		tabnew
	endif
	"opening current buffer in new window
	exe "b".l:cur_buf
endfunc
