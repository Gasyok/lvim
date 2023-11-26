vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {
	"jdtls",
	"clangd",
	"omnisharp",
})

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ name = "black" },
	{ name = "stylua" },
	{
		name = "prettier",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespace
		-- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
		args = { "--print-width", "100" },
		---@usage only start in these filetypes, by default it will attach to all filetypes it supports
		filetypes = { "typescript", "typescriptreact", "javascript" },
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
