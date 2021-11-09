local M = {}

local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp = require("cmp")

local cmp_opts = {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 5 },
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
				gh_issues = "[issues]",
			},
		}),
	},
	experimental = {
		native_menu = true,
	},
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
}

local buffer_source_opts = {
	sources = {
		{ name = "buffer" },
	},
}

local cmdline_and_path_source_opts = {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
}

M.setup = function()
	cmp.setup(cmp_opts)
	cmp.setup.cmdline("/", buffer_source_opts)
	cmp.setup.cmdline(":", cmdline_and_path_source_opts)
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
