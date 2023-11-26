lvim.plugins = {
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{ "mfussenegger/nvim-dap" },
	{ "mfussenegger/nvim-dap-python" },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						dap = {
							justMyCode = false,
							console = "integratedTerminal",
						},
						args = { "--log-level", "DEBUG", "--quiet" },
						runner = "pytest",
					}),
				},
			})
		end,
	},
	{ "nvim-neotest/neotest-python" },
	{ "AckslD/swenv.nvim" },
	{ "folke/tokyonight.nvim" },
	-- { "ellisonleao/gruvbox.nvim" },
	{ "lunarvim/lunar.nvim" },
	{ "morhetz/gruvbox" },
	{ "sainnhe/gruvbox-material" },
	{ "sainnhe/sonokai" },
	{ "sainnhe/edge" },
	{ "lunarvim/horizon.nvim" },
	{ "tomasr/molokai" },
	{ "ayu-theme/ayu-vim" },
}

-- Todo comments
lvim.lsp.buffer_mappings.normal_mode["<leader>lt"] = nil
lvim.keys.normal_mode["<leader>lt"] = ":TodoTelescope<CR>"

lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
