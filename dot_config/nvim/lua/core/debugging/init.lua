local M = {}

local dap_ui = require("core.debugging.ui")
local python = require("core.debugging.python")
local js = require("core.debugging.js")

M.setup = function()
	dap_ui.setup()
	python.setup()
	-- js.setup()
end

return M
