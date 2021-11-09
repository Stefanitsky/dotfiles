local M = {}

local opts = {
	popup_menu = "dark",
}

M.setup = function()
	vim.g.material_style = "deep ocean"
	vim.cmd("colorscheme material")
	require("material").setup(opts)
end

return M
