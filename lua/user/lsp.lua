vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {
	"jdtls",
	"clangd",
	"omnisharp",
})

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ name = "black" },
	{ name = "stylua" },
	-- {
	-- 	name = "prettier",
	-- 	---@usage arguments to pass to the formatter
	-- 	-- these cannot contain whitespace
	-- 	-- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
	-- 	args = { "--print-width", "100" },
	-- 	---@usage only start in these filetypes, by default it will attach to all filetypes it supports
	-- 	filetypes = { "typescript", "typescriptreact", "javascript" },
	-- },
	{
		name = "sqlformat",
		args = { "--keywords", "upper" },
		filetypes = { "sql" },
	},
	{
		command = "prettierd",
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"css",
			"scss",
			"less",
			"html",
			"yaml",
			"markdown",
			"markdown.mdx",
			"graphql",
			"handlebars",
			"json",
		},
	},
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ name = "flake8", filetypes = { "python" } },
	{ name = "hadolint", filetypes = { "dockerfile" } },
	{
		name = "shellcheck",
		args = { "--severity", "warning" },
	},
})

local lspconfig = require("lspconfig")
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }

local cmd = {
	"clangd",
	"--background-index",
	"--clang-tidy",
	"--suggest-missing-includes",
	"--completion-style=detailed",
	"--fallback-style=Google",
	"-j=12",
	"--all-scopes-completion",
	"--pch-storage=disk",
	"--log=error",
	"--header-insertion=iwyu",
	"--header-insertion-decorators",
	"--enable-config",
	"--offset-encoding=utf-16",
	"--ranking-model=heuristics",
	"--folding-ranges",
}
lspconfig.clangd.setup({
	cmd = cmd,
	filetypes = { "c", "cpp", "objc", "objcpp" },
	on_attach = require("lvim.lsp").common_on_attach,
	on_init = require("lvim.lsp").common_on_init,
	capabilities = capabilities,
})
