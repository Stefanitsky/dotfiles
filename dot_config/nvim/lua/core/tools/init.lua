local M = {}

M.setup = function()
	require("core.tools.discord_presence").setup()
	require("core.tools.git").setup()
	require("core.tools.telescope").setup()
	require("core.tools.terminal").setup()
	require("core.tools.testing").setup()
end

return M
