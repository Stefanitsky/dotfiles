local M = {}

-- https://github.com/sumneko/lua-language-server
M.opts = {
	cmd = { "lua-language-server" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = { "lua/?.lua", "lua/?/init.lua" },
			},
			diagnostics = {
				enable = true,
				globals = {
					"vim",
					"use",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				maxPreload = 1000,
				preloadFileSize = 1000,
			},
		},
	},
}

return M
