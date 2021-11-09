local M = {}

local dap = require("dap")

M.debug_file = function()
	local path = vim.api.nvim_buf_get_name(0)
	dap.run({
		type = "node2",
		request = "launch",
		cwd = vim.fn.getcwd(),
		runtimeArgs = { "--inspect-brk", "/usr/local/bin/jest", "--no-coverage", "--", path },
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	})
end

M.setup = function() end
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/tools/vscode-node-debug2/out/src/nodeDebug.js" },
}
dap.configurations.javascript = {
	{
		type = "node2",
		request = "launch",
		program = "${workspaceFolder}/${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}
return M
