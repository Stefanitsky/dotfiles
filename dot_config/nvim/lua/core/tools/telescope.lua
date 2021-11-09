local M = {}

local opts = {}

M.setup = function ()
  require('telescope').setup{opts}
end

return M
