local opt = vim.opt

lvim.format_on_save = true

opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarindent = true
opt.hlsearch = false
opt.incsearch = true
opt.cursorline = true -- highlight the current cursor line
opt.termguicolors = true
opt.signcolumn = "yes"
opt.clipboard:append("unnamedplus")
opt.swapfile = false
opt.wrap = false
opt.linebreak = true
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

lvim.builtin.telescope.defaults.path_display = {
	shorten = 4,
}

lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"cpp",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.project.detection_methods = { "lsp", "pattern" }
lvim.builtin.project.patterns = {
	".git",
	"package-lock.json",
	"yarn.lock",
	"package.json",
	"requirements.txt",
}
