local utils = require("utils")
local map = utils.map

-- Buffers
map("n", "<leader>bh", ":bf<CR>")
map("n", "<leader>bl", ":bl<CR>")
map("n", "<leader>bj", ":bn<CR>")
map("n", "<leader>bk", ":bp<CR>")
map("n", "<leader>bq", ":bd<CR>")

-- Telescope
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")

-- Panes navigation
map("n", "<C-h>", ":wincmd h<CR>")
map("n", "<C-j>", ":wincmd j<CR>")
map("n", "<C-k>", ":wincmd k<CR>")
map("n", "<C-l>", ":wincmd l<CR>")

-- Nvim Tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- Debugging
map("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>")
map("n", "<leader>dj", "<cmd>lua require('dap').step_over()<cr>")
map("n", "<leader>di", "<cmd>lua require('dap').step_into()<cr>")
map("n", "<leader>dk", "<cmd>lua require('dap').step_out()<cr>")
map("n", "<leader>dt", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
map("n", "<leader>dl", "<cmd>lua require('dap').run_last()<cr>")
map("n", "<leader>dd", "<cmd>Telescope dap commands<cr>")
map("n", "<leader>dv", "<cmd>Telescope dap variables<cr>")
map("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
map("n", "<leader>de", "<cmd>lua require('dapui').toggle()<cr>")

-- Testing

map("n", "<leader>tn", "<cmd>TestNearest<cr>")
map("n", "<leader>tf", "<cmd>TestFile<cr>")
map("n", "<leader>tl", "<cmd>TestLast<cr>")
map("n", "<leader>ts", "<cmd>TestSuite<cr>")
