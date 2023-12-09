local themes = {
	gruvbox = "gruvbox",
	rose_pine = "rose-pine",
	lunar = "lunar",
	gruvbox_material = "gruvbox-material",
	onedarker = "onedarker",
	onedark = "onedark",
	horizon = "horizon",
	tokyonight = "tokyonight",
	tokyonight_night = "tokyonight-night",
	tokyonight_day = "tokyonight-day",
	tokyonight_moon = "tokyonight-moon",
	desert = "desert",
	morning = "morning",
	sonokai = "sonokai",
	edge = "edge",
	ayu = "ayu",
}

lvim.transparent_window = true
lvim.colorscheme = themes.lunar

local extra_opts = {
	sonokai = {
		styles = {
			espresso = "espresso",
			shusia = "shusia",
			default = "default",
		},
	},
	gruvbox = {
		styles = {
			light = "light",
			dark = "dark",
		},
	},
	ayu = {
		styles = {
			mirage = "mirage",
			light = "light",
			dark = "dark",
		},
	},
	edge = {
		styles = {
			aura = "aura",
			neon = "neon",
		},
		airline_theme = "edge",
		lualine_theme = "edge",
	},
}

if vim.g.neovide then
	lvim.transparent_window = false
	return
end

if lvim.colorscheme == themes.sonokai then
	vim.g.sonokai_style = "espresso"
	vim.g.sonokai_style = "shusia"
	vim.g.sonokai_style = "default"
end

if lvim.colorscheme == themes.edge then
	vim.g.airline_theme = extra_opts.edge.airline_theme
	vim.g.edge_style = extra_opts.edge.styles.neon
	lvim.builtin.lualine.options.theme = extra_opts.edge.lualine_theme
end

if lvim.colorscheme == themes.ayu then
	require("ayu").setup({
		mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
		overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
	})
end

if lvim.colorscheme == themes.gruvbox then
	local gruvbox_style = extra_opts.gruvbox.styles.dark

	-- Применение стиля Gruvbox
	if gruvbox_style == "light" then
		-- Настройки для светлой темы Gruvbox
		vim.cmd("set background=light")
		vim.cmd("colorscheme gruvbox-light")
	elseif gruvbox_style == "dark" then
		-- Настройки для темной темы Gruvbox
		vim.cmd("set background=dark")
		vim.cmd("colorscheme gruvbox")
	end
end
