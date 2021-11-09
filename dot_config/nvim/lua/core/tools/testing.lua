local M = {}

M.setup = function()
	local toggleterm_strategy = function(cmd)
		require("toggleterm").exec(cmd)
	end

	vim.g["test#custom_strategies"] = { toggleterm = toggleterm_strategy }
	vim.g["test#floaterm#start_normal"] = 1
	vim.g["test#strategy"] = "toggleterm"

	-- Python
	vim.g["test#python#runner"] = "pytest"
	vim.g["test#python#pytest#options"] = "--color=yes"

	-- JS
	vim.g["test#javascript#runner"] = "jest"
end

return M
