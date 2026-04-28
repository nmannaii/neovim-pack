local ok, neo_tree = pcall(require, "neo-tree")
if not ok then
	return
end

-- Recommended: disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

neo_tree.setup({
	sources = { "filesystem", "buffers", "git_status" },
	open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
	filesystem = {
		bind_to_cwd = false,
		follow_current_file = { enabled = true },
		use_libuv_file_watcher = true,
	},
	window = {
		mappings = {
			["l"] = "open",
			["h"] = "close_node",
			["<space>"] = "none",
			["Y"] = {
				function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					vim.fn.setreg("+", path, "c")
				end,
				desc = "Copy Path to Clipboard",
			},
			["P"] = { "toggle_preview", config = { use_float = false } },
		},
	},
	default_component_configs = {
		indent = {
			with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		git_status = {
			symbols = {
				-- Change type
				added = "", -- or "✚"
				modified = "", -- or ""
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "󰁕", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "󰄱",
				staged = "",
				conflict = "",
			},
		},
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>ge", function() require("neo-tree.command").execute({ source = "git_status", toggle = true }) end, { desc = "Git Explorer" })
vim.keymap.set("n", "<leader>be", function() require("neo-tree.command").execute({ source = "buffers", toggle = true }) end, { desc = "Buffer Explorer" })
