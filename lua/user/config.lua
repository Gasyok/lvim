vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

lvim.plugins = {
	{ "github/copilot.vim" },
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
	{ "windwp/nvim-ts-autotag" },
	{ "AckslD/swenv.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "lunarvim/lunar.nvim" },
	{ "morhetz/gruvbox" },
	{ "navarasu/onedark.nvim" },
	{ "catppuccin/nvim" },
	{ "sainnhe/gruvbox-material" },
	{ "sainnhe/sonokai" },
	{ "sainnhe/edge" },
	{ "lunarvim/horizon.nvim" },
	{ "tomasr/molokai" },
	{ "Shatur/neovim-ayu" },
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

-- Lua configuration example for html-lsp with htmldjango
lvim.lang.htmldjango.lsp.setup = {
	provider = "html", -- Assuming html LSP is used for htmldjango
	-- Additional configuration options specific to the html LSP
}

-- lvim.g.copilot_no_tab_map = true
-- lvim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- lvim.g.copilot_assume_mapped = true

-- local ok, copilot = pcall(require, "copilot")
-- if not ok then
-- 	return
-- end

-- copilot.setup({
-- 	suggestion = {
-- 		keymap = {
-- 			accept = "<c-l>",
-- 			next = "<c-j>",
-- 			prev = "<c-k>",
-- 			dismiss = "<c-h>",
-- 		},
-- 	},
-- })

-- local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
