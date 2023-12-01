lvim.plugins = {
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{ "mfussenegger/nvim-dap" },
	{ "CRAG666/code_runner.nvim" },
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
	{ "Shatur/neovim-ayu" },
	-- { "ayu-theme/ayu-vim" },
}

-- Todo comments
lvim.lsp.buffer_mappings.normal_mode["<leader>lt"] = nil
lvim.keys.normal_mode["<leader>lt"] = ":TodoTelescope<CR>"

lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
local dap = require("dap")

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/local/Cellar/llvm/17.0.5/bin/lldb-vscode", -- обновленный путь
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		target = "arm64",
		-- 💀
		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		runInTerminal = false,
	},
}

-- Для C и Rust
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
