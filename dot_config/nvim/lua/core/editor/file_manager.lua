local M = {}

local opts = {
	auto_resize = true,
	ignore_ft_on_setup = { ".git", "node_modules", "__pycache__" },
	auto_close = 1,
	update_focused_file = {
		enable = true,
	},
}

-- Disable netrw builtin file Manager
vim.g.loaded_netrwPlugin = false

M.setup = function()
	require("nvim-tree").setup(opts)
end

return M
