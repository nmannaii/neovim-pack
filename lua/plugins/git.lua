local map = vim.keymap.set

--- start => gitsigns
local gs = require("gitsigns")
gs.setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged_enable = true,
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
	blame_formatter = nil, -- Use default
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})
-- Navigation
map("n", "]h", gs.next_hunk, { desc = "Next Hunk" })
map("n", "[h", gs.prev_hunk, { desc = "Prev Hunk" })

-- Actions
map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })

map("v", "<leader>gs", function() -- stage selected hunk
	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk" })
map("v", "<leader>gr", function() -- reset selected hunk
	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset hunk" })

map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" }) -- stage whole buffer
map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" }) -- unstage whole buffer
map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
map("n", "<leader>gbl", function()
	gs.blame_line({ full = true })
end, { desc = "Blame line" })
map("n", "<leader>gB", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
map("n", "<leader>gd", gs.diffthis, { desc = "Diff this" })
map("n", "<leader>gD", function()
	gs.diffthis("~")
end, { desc = "Diff this ~" })

-- Text object
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns select hunk" })

--- end => gitsigns

--- start => lazygit
map({ "n" }, "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open lazy git" })
