--- start => fugitive
local function map(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { desc = desc })
end

vim.keymap.set("n", "<leader>gg", "<cmd>tab G<cr>", { desc = "Fugitive fullscreen tab" })

local myFugitive = vim.api.nvim_create_augroup("myFugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
	group = myFugitive,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "<leader>P", function()
			vim.cmd.Git("push")
		end, opts)

		-- NOTE: rebase always
		vim.keymap.set("n", "<leader>p", function()
			vim.cmd.Git({ "pull", "--rebase" })
		end, opts)

		-- NOTE: easy set up branch that wasn't setup properly
		vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
	end,
})
--- end => fugitive

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
map("n", "]h", gs.nav_hunk('next'), "Next Hunk")
map("n", "[h", gs.nav_hunk('prev'), "Prev Hunk")

-- Actions
map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")

map("v", "<leader>gs", function() -- stage selected hunk
	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, "Stage hunk")
map("v", "<leader>gr", function() -- reset selected hunk
	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, "Reset hunk")

map("n", "<leader>gS", gs.stage_buffer, "Stage buffer") -- stage whole buffer
map("n", "<leader>gR", gs.reset_buffer, "Reset buffer") -- unstage whole buffer
map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")
map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
map("n", "<leader>gbl", function()
	gs.blame_line({ full = true })
end, "Blame line")
map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")
map("n", "<leader>gd", gs.diffthis, "Diff this")
map("n", "<leader>gD", function()
	gs.diffthis("~")
end, "Diff this ~")

-- Text object
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")

--- end => gitsigns


--- start => lazygit
map({"n"}, "<leader>lg", "<cmd>LazyGit<cr>", "Open lazy git")
