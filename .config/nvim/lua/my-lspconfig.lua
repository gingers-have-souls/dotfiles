local lspconfig = require('lspconfig')
local withsnippet = vim.lsp.protocol.make_client_capabilities()
withsnippet.textDocument.completion.completionItem.snippetSupport = true

local custom_attach = function()
	require('completion').on_attach()

	vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
end

lspconfig.clangd.setup{
	on_attach = custom_attach,
}
lspconfig.rust_analyzer.setup{
	on_attach = custom_attach,
}
lspconfig.jedi_language_server.setup{
	on_attach = custom_attach,
}
lspconfig.html.setup{
	capabilities = withsnippet,
	on_attach = custom_attach,
}
lspconfig.cssls.setup{
	on_attach = custom_attach,
}
lspconfig.jsonls.setup{
	on_attach = custom_attach,
}
lspconfig.tsserver.setup{
	on_attach = custom_attach,
}
lspconfig.vimls.setup{
	on_attach = custom_attach,
}
lspconfig.svelte.setup{
	on_attach = custom_attach,
}
lspconfig.sumneko_lua.setup{
	cmd = { 'lua-language-server' },
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	},
	on_attach = custom_attach,
}
