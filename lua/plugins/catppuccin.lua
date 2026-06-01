require("catppuccin").setup({
	flavor = "macchiato",
	integrations = {
		dashboard = true,
		snacks = {
			enabled = true,
			indent_scope_color = "overlay2", -- catppuccin color (eg. `lavender`) Default: overlay2
		},
	},
})

-- Color scheme
vim.cmd("colorscheme catppuccin-macchiato")
