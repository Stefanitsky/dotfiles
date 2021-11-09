local M = {}

local opts = {
	show_end_of_line = true,
}

M.setup = function()
	vim.opt.list = true
	vim.opt.listchars:append("eol:↴")

	require("indent_blankline").setup(opts)
end

return M
