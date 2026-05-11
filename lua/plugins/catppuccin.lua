require("catppuccin").setup({
	flavor = "mocha",
	transparent_background = true,
	integrations = {
		dashboard = true,
		snacks = {
			enabled = true,
			indent_scope_color = "overlay2", -- catppuccin color (eg. `lavender`) Default: overlay2
		},
	},
})

local function set_normal_float_highlight()
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
	-- Optional: Make the picker/dashboard background transparent
	vim.api.nvim_set_hl(0, "SnacksPickerNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = "none" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = set_normal_float_highlight,
})

-- Color scheme
vim.cmd("colorscheme catppuccin-mocha")
