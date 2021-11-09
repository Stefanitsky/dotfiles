local M = {}

local dap_ui_opts = {
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = "<CR>",
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
	sidebar = {
		-- You can change the order of elements in the sidebar
		elements = {
			-- Provide as ID strings or tables with "id" and "size" keys
			{
				id = "scopes",
				size = 0.25, -- Can be float or integer > 1
			},
			{ id = "breakpoints", size = 0.25 },
			{ id = "stacks", size = 0.25 },
			{ id = "watches", size = 0.25 },
		},
		size = 40,
		position = "left", -- Can be "left", "right", "top", "bottom"
	},
	tray = {
		elements = { "repl" },
		size = 10,
		position = "bottom", -- Can be "left", "right", "top", "bottom"
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
}

M.setup = function()
	vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
	require("nvim-dap-virtual-text").setup()
	require("telescope").load_extension("dap")
	require("dapui").setup(dap_ui_opts)
end

return M
