local M = {}

M.setup = function()
	require("core.editor.autopairs").setup()
	require("core.editor.file_manager").setup()
	require("core.editor.indent").setup()
	require("core.editor.completition").setup()
	require("core.editor.statusline").setup()
	require("core.editor.treesitter").setup()
	require("core.editor.colorscheme").setup()
end

return M
