local M = {}

local lsp = require("lspconfig")
local utils = require("utils")
local default_lsp_opts = require("core.lsp.servers.configs.default").opts

local setup_lsp_servers = function(server_names)
	for _, server_name in pairs(server_names) do
		local ok, module = pcall(require, "core.lsp.servers.configs." .. server_name)

		local opts = default_lsp_opts

		if ok then
			opts = utils.merge_tables(default_lsp_opts, module.opts)
		end

		lsp[server_name].setup(opts)
	end
end

M.setup = function()
	setup_lsp_servers({
		"sumneko_lua",
		"tsserver",
		"pyright",
		"efm",
	})
end

return M
