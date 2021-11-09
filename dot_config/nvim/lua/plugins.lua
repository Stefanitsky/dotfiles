local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- Install some 3rd party plugins
return require("packer").startup(function(use)
	-- Plugins here
	use("wbthomason/packer.nvim")

	-- File Manager
	-- https://github.com/kyazdani42/nvim-tree.lua
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- Colorscheme
	use("marko-cerovac/material.nvim")

	-- LSP
	-- https://github.com/neovim/nvim-lspconfig
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("onsails/lspkind-nvim") -- Better cml info types
	use("ray-x/lsp_signature.nvim") -- Signature help on typing
	use({ "tami5/lspsaga.nvim", branch = "nvim51" })

	-- Better syntax and editing
	-- https://github.com/nvim-treesitter/nvim-treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("tpope/vim-commentary")

	-- All-in-one (finder, lsp etc.)
	-- https://github.com/nvim-telescope/telescope.nvim
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Identation
	-- https://github.com/lukas-reineke/indent-blankline.nvim
	use("lukas-reineke/indent-blankline.nvim")

	-- Statusline + Tabline
	use({
		"kdheepak/tabline.nvim",
		requires = { "hoob3rt/lualine.nvim", "kyazdani42/nvim-web-devicons" },
	})

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Discord Presence
	-- https://github.com/andweeb/presence.nvim
	use("andweeb/presence.nvim")

	-- Debugging
	-- https://github.com/mfussenegger/nvim-dap
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-dap-python")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")
	use("David-Kunz/jester")

	-- Testing
	-- https://github.com/vim-test/vim-test
	use({ "vim-test/vim-test" })

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Automatically set up after cloning packer.nvim
	if packer_bootstrap then
		require("packer").sync()
	end
end)
