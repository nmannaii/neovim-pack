require("telescope").setup({
	defaults = {
		path_display = { "smart" },
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
require("telescope").load_extension("ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

---- notes

local dir = os.getenv("HOME") .. "/notes"
vim.keymap.set("n", "<leader>nn", function()
	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end

	require("telescope.builtin").find_files({
		cwd = dir,
	})
end)

vim.keymap.set("n", "<leader>ng", function()
	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end

	require("telescope.builtin").live_grep({
		cwd = dir,
	})
end)

vim.keymap.set('n', '<leader>ni', function()
  vim.cmd('edit ' .. dir .. '/inbox.md')
end)
