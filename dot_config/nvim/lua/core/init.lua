local debugging = require("core.debugging")
local editor = require("core.editor")
local lsp = require("core.lsp")
local tools = require("core.tools")

debugging.setup()
editor.setup()
tools.setup()
lsp.setup()
