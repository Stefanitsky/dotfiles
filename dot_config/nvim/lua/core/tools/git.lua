local M = {}
local utils = require('utils')
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", utils.default_options)
  end,
})

local lazygit_toggle = function ()
  lazygit:toggle()
end

_G.lazygit_toggle = lazygit_toggle

M.lazygit_toggle = lazygit_toggle

M.setup = function()
  require('gitsigns').setup()
  utils.map("n", "<leader>g", "<cmd>lua lazygit_toggle()<cr>")
end

return M
