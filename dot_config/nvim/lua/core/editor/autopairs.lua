local M = {}

local opts = {
  check_ts = true,
} 

M.setup = function ()
  require('nvim-autopairs').setup(opts)
end

return M
