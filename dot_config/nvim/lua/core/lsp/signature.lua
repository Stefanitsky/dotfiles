local M = {}

local opts = {
	floating_window_above_cur_line = false,
	handler_opts = {
		border = "none",
	},
	use_lspsaga = false,
	hint_enable = false,
}

M.setup = function()
	require("lsp_signature").setup(opts)
end

return M
