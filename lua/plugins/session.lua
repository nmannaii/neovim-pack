require("persistence").setup({})

vim.api.nvim_create_autocmd("BufReadPre", {
	once = true,
	callback = function()
		require("persistence")
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	once = true,
	callback = function()
    vim.cmd("Neotree close")
	end,
})

local map = vim.keymap.set

map("n", "<leader>qs", function()
	require("persistence").load()
end, { desc = "Restore Session" })

map("n", "<leader>qS", function()
	require("persistence").select()
end, { desc = "Select Session" })

map("n", "<leader>ql", function()
	require("persistence").load({ last = true })
end, { desc = "Restore Last Session" })

map("n", "<leader>qd", function()
	require("persistence").stop()
end, { desc = "Don't Save Current Session" })
