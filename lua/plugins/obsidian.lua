require("obsidian").setup({
	picker = {
		name = "snacks.picker", -- use snacks picker
		-- name = "telescope.nvim",   -- or telescope
		-- name = "fzf-lua",     -- or fzf-lua
		-- name = "mini.pick",   -- or mini.pick
	},
	legacy_commands = false, -- this will be removed in 4.0.0
	workspaces = {
		{
			name = "personal",
			path = "~/notes/obsidian/personal",
		},
		{
			name = "work",
			path = "~/notes/obsidian/work",
		},
	},
	checkbox = {
		enabled = true,
		create_new = true,
		order = { " ", "x", "~", "!", "-" },
	},
	callbacks = {
		enter_note = function(note)
			vim.keymap.set("n", "<leader>ch", "<cmd>Obsidian toggle_checkbox<cr>", {
				buffer = true,
				desc = "Toggle checkbox",
			})

			local actions = require("obsidian.actions")
			vim.keymap.set("n", "<leader>;", actions.add_property, { buffer = true, desc = "Add frontmatter property" })
			vim.keymap.set("n", "<Tab>", function()
				actions.nav_link("next")
			end, { buffer = true, desc = "Go to next link" })
			vim.keymap.set("n", "<S-Tab>", function()
				actions.nav_link("prev")
			end, { buffer = true, desc = "Go to previous link" })
		end,
	},
})
