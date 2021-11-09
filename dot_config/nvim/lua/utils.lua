local M = {}

local map = vim.api.nvim_set_keymap

M.default_options = { noremap = true, silent = true }

M.merge_tables = function(t1, t2)
  local res = {}

  for k,v in pairs(t1) do
    res[k] = v
  end

  for k,v in pairs(t2) do
    res[k] = v
  end

  return res
end

M.map = function (mode, lhs, rhs, opts)
  if not opts then
    opts = M.default_options
  else
    opts = M.merge_tables(M.default_options, opts)
  end

  map(mode, lhs, rhs, opts)
end

return M

