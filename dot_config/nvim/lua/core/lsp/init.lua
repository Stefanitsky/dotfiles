local M = {}

function M.setup()
	require("core.lsp.saga").setup()
	require("core.lsp.signature").setup()
	require("core.lsp.servers").setup()
end

return M
