local M = {}

M.on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	local cap = client.resolved_capabilities

	-- Only EFM language server can use formatting
	if client.name ~= "efm" then
		cap.document_formatting = false
	else
		vim.cmd([[
      augroup Format
        au! * <buffer>
        au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 5000)
      augroup END
    ]])
	end

	-- Highligh and hover doc for current text document position
	if cap.document_highlight then
		vim.cmd([[
      augroup lsp_document_highlight
        au! * <buffer>
        au CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        au CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
	end

	-- Custom handlers
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		update_in_insert = true,
	})

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

	if client.name == "python" then
		buf_set_keymap("n", "<leader>dn", "<cmd>lua require('dap-python').test_method()<cr>", opts)
	elseif client.name == "javascript" then
		buf_set_keymap("n", "<leader>df", "<cmd>lua require('core.debugging.js').debug_file()", opts)
	end

	buf_set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
	buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	buf_set_keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	buf_set_keymap("n", "<leader>sj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	buf_set_keymap("n", "<leader>sk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	buf_set_keymap("n", "<leader>sp", "<cmd>Lspsaga preview_definition<cr>", opts)
	buf_set_keymap("n", "<leader>sd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	buf_set_keymap("n", "<leader>sf", "<cmd>Lspsaga lsp_finder<cr>", opts)
	buf_set_keymap("n", "<C-K>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opts)
	buf_set_keymap("n", "<C-J", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opts)
end

-- Add additional capabilities supported by nvim-cmp
M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

M.opts = {
	on_attach = M.on_attach,
	capabilities = M.capabilities,
}

return M
