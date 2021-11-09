local M = {}

local opts = {
	options = {
		theme = "material-nvim",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_lsp", "coc" } } },
		lualine_c = {},
		lualine_x = { "encoding" },
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {
		lualine_a = { "buffers" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "tabs" },
	},
	extensions = { "nvim-tree", "toggleterm" },
}

M.setup = function()
	require("lualine").setup(opts)
end

return M
