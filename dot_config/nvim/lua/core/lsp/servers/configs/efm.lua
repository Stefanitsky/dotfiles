local M = {}

-- https://github.com/mattn/efm-langserver
local prettier = { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true }
local stylua = { formatCommand = "stylua -s -", formatStdin = true }
local eslint = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintIgnoreExitCode = true,
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	formatStdin = true,
}
local black = {
	formatCommand = "poetry run black --quiet -",
	formatStdin = true,
}
local yapf = {
	formatCommand = "poetry run yapf --quiet",
	formatStdin = true,
}
local flake8 = {
	lintCommand = "poetry run flake8 --format '%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s' --stdin-display-name ${INPUT} -",
	lintStdin = true,
	lintIgnoreExitCode = true,
	lintFormats = { "%f:%l:%c: %t%n%n%n %m" },
}
local isort = {
	formatCommand = "poetry run isort --quiet -",
	formatStdin = true,
}
local mypy = {
	lintCommand = "poetry run mypy",
	lintStdin = true,
	lintFormats = {
		"%f:%l:%c: %trror: %m",
		"%f:%l:%c: %tarning: %m",
		"%f:%l:%c: %tote: %m",
	},
}

local languages = {
			css = { prettier },
			html = { prettier },
			javascript = { prettier, eslint },
			javascriptreact = { prettier, eslint },
			json = { prettier },
			lua = { stylua },
			markdown = { prettier },
			scss = { prettier },
			typescript = { prettier, eslint },
			typescriptreact = { prettier, eslint },
			yaml = { prettier },
			python = {},
		}

M.opts = {
	init_options = { documentFormatting = true, codeAction = true },
  filetypes = vim.tbl_keys(languages),
	settings = {
    languages = languages,
    log_level = 1,
    log_file = '~/efm.log',
	},
	on_init = function(client)
		-- TODO: async load
		-- TODO: load depends on a main client (pyright / tsserver / lua etc)
		-- We need to register only available linters and formatters, because it improves perfomance
		local result = vim.fn.systemlist(
			[[ poetry run pip list --disable-pip-version-check | grep -w -o '^black \|^yapf \|^flake8 \|^isort \|^mypy ' ]]
		)

		for _, package_name in pairs(result) do
			local package_config = M[string.gsub(package_name, "%s+", "")]
			if package_config then
				table.insert(client.config.settings.languages.python, package_config)
			end
		end

		client.notify("workspace/didChangeConfiguration")
		return true
	end,
}

return M
