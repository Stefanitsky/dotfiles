-- Extra lines on navigation
vim.opt.scrolloff = 10

-- Enable full colors support
vim.opt.termguicolors = true

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Allows you to hide buffers with unsaved changes without being prompted
vim.opt.hidden = true

-- Don't bother updating screen during macro playback
vim.opt.lazyredraw = true

-- Wrap long lines at characters in 'breakat'
vim.opt.linebreak = true

-- Show line numbers in gutter
vim.opt.number = true

-- <tab>/<BS> indent/dedent in leading whitespace
vim.opt.smarttab = true

-- Don't create swap files
vim.opt.swapfile = false

-- Tab behavior
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Stop annoying beeping for non-error errors
vim.opt.visualbell = true
vim.opt.errorbells = true

-- Auto line ending chars
vim.opt.fileformats = "unix,mac,dos"

-- Default encoding
vim.opt.encoding = 'utf-8'

-- Alway draw sign column
vim.wo.signcolumn = 'yes'

-- Reduce updatetime
vim.o.updatetime = 250

