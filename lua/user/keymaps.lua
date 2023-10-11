local kind = require("user.kind")
local wk = lvim.builtin.which_key

lvim.leader = "space"

lvim.keys.normal_mode[";"] = ":"
lvim.keys.insert_mode["jp"] = "<ESC>"

-- Buffer close --
lvim.keys.normal_mode["<S-q>"] = { ":BufferKill<CR>", { silent = false } }
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- Visual mode indent
lvim.keys.visual_mode["<Tab>"] = ">gv"
lvim.keys.visual_mode["<S-Tab>"] = "<gv"

-- clear search highlights
lvim.keys.normal_mode["<leader>nh"] = ":nohl<CR>"

-- Find and replace
lvim.keys.normal_mode["<leader>FR"] = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]

-- lsp
lvim.lsp.buffer_mappings.normal_mode["gr"] = {
	":lua require'telescope.builtin'.lsp_references()<cr>",
	kind.cmp_kind.Reference .. " Find references",
}

wk.mappings["w"] = {
	name = " " .. kind.icons.screen .. " Window Ctrl",
	h = { "<C-w>|", "Maximize window horizontally (|)" },
	v = { "<C-w>_", "Maximize window vertically (_)" },
	e = { "<C-w>=", "Resize windows equally" },
	s = { ":lua require('telescope-tabs').list_tabs()<cr>", "Search Tabs" },
}

wk.mappings["t"] = {
	name = " Telescope",
	p = { ":Telescope projects<cr>", "Projects" }, -- requires telescope-project.nvim plugin
	r = { ":Telescope resume<cr>", "Resume" },
}

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["dM"] =
	{ "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
	"<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>",
	"Test Class",
}
lvim.builtin.which_key.mappings["dF"] = {
	"<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
	"Test Class DAP",
}
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

-- binding for switching
lvim.builtin.which_key.mappings["C"] = {
	name = "Python",
	c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}
