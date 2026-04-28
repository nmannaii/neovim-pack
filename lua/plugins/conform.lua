require("conform").setup({
	formatters_by_ft = {
		html = { "html-beautify-custom" },
		htmlangular = { "htmlangular-beautify-custom" },
		cs = { "csharpier" },
		lua = { "stylua" },
	},
	formatters = {
		["html-beautify-custom"] = {
			command = "js-beautify",
			args = {
				"--type",
				"html",
				"--templating",
				"angular",
				"--wrap-attributes",
				"force-aligned",
				"--indent-size",
				"2",
			},
			stdin = true,
		},
		["htmlangular-beautify-custom"] = {
			command = "js-beautify",
			args = {
				"--type",
				"html",
				"--templating",
				"angular",
				"--wrap-attributes",
				"force-aligned",
				"--indent-size",
				"2",
			},
			stdin = true,
		},
	},
})

vim.keymap.set({ "n", "x" }, "<leader>cf", function()
	require("conform").format({ timeout_ms = 3000 })
end, { desc = "Format Injected Langs" })
