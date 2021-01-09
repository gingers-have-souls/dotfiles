nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

let g:which_key_map =  {
	\ '`' : [':source $HOME/.config/nvim/general/mappings/vim-which-key-maps.vim', 'Source which-key maps'],
	\ ' ' : [':call feedkeys(":nohlsearch\<CR>\<C-l>")', 'Undo search hl'],
	\ 't' : [':FloatermNew', 'Spawn new floaterm'],
	\ }

let g:which_key_map.s = {
	\ 'name' : '+startify',
	\ 'S' : [':Startify', 'Open startify'],
	\ 'T' : [':tabe|Startify', 'New startify tab'],
	\ 'l' : [':SLoad', 'Load session'],
	\ 's' : [':SSave', 'Save session'],
	\ 'd' : [':SDelete', 'Delete session'],
	\ 'c' : [':SClose', 'Close session'],
	\ }

let g:which_key_map.f = {
	\ 'name' : '+fzf',
	\ 'f' : [':Files', 'Files'],
	\ 'B' : [':Buffers', 'Buffers'],
	\ 'l' : [':Lines', 'All lines'],
	\ 'b' : [':BLines', 'Lines in current buffer'],
	\ 'W' : [':Windows', 'Windows'],
	\ 'F' : [':History', 'File history'],
	\ 'C' : [':History:', 'Command history'],
	\ 'S' : [':History/', 'Search history'],
	\ 's' : [':Snippets', 'Snippets'],
	\ 'H' : [':Helptags', 'Help tags'],
	\ }

let g:which_key_map.g = {
	\ 'name' : '+git',
	\ 'f' : [':GFiles', 'All git files'],
	\ 'F' : [':GFiles?', 'Changed git files'],
	\ 'c' : [':Commits', 'Search all commits'],
	\ 'C' : [':BCommits', 'Search commits for file'],
	\ }

let g:which_key_map.l = {
	\ 'name' : '+lsp',
	\ 'G' : [':call LSPBufGetClients()', 'Get clients'],
	\ 'R' : [':call LSPForceReload()', 'Force-reload'],
	\ 'a' : [':call LSPCodeAction()', 'Code action'],
	\ 'D' : [':call LSPJumpToDeclaration()', 'Jump to declaration'],
	\ 'd' : [':call LSPJumpToDefinition()', 'Jump to definition'],
	\ 'u' : [':call LSPDocumentHighlight()', 'Underline and bolden'],
	\ 's' : [':call LSPDocumentSymbols()', 'List all symbols'],
	\ 'f' : [':call LSPFormatting()', 'Format file'],
	\ 'h' : [':call LSPHover()', 'Show hover info'],
	\ 'i' : [':call LSPImplementation()', 'List all implementations'],
	\ 'c' : [':call LSPIncomingCalls()', 'List all call sites'],
	\ 'C' : [':call LSPIncomingCalls()', 'List outgoing calls'],
	\ 'r' : [':call LSPReferences()', 'List all references'],
	\ 'n' : [':call LSPRename()', 'Rename symbol'],
	\ 't' : [':call LSPTypeDefinition()', 'Jump to type definition'],
	\ 'w' : [':call LSPWorkspaceSymbol()', 'List symbols in workspace'],
	\ 'e' : [':call LSPDiagnosticGotoNext()', 'Go to next error'],
	\ 'E' : [':call LSPDiagnosticGotoPrev()', 'Go to previous error'],
	\ 'L' : [':call LSPDiagnosticSetLoclist()', 'List errors'],
	\ }

let g:which_key_map.w = {
	\ 'name' : '+writing',
	\ 't' : [':call WritingModeToggle()', 'Toggle writing mode'],
	\ 'e' : [':set spelllang=en_ca', 'Canadian English'],
	\ 'f' : [':set spelllang=fr', 'French'],
	\ 'g' : [':set spelllang=de', 'German'],
	\ 's' : [':set spelllang=es', 'Spanish'],
	\ }

let g:which_key_map.m = {
	\ 'name' : '+movement',
	\ 'h' : [':call MoveToPrevTab()', 'Move to prev tab'],
	\ '<Left>' : [':call MoveToPrevTab()', 'Move to prev tab'],
	\ 'l' : [':call MoveToNextTab()', 'Move to next tab'],
	\ '<Right>' : [':call MoveToNextTab()', 'Move to next tab'],
	\ }

call which_key#register('<Space>', "g:which_key_map")
