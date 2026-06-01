local grug = require("grug-far")

grug.setup()

vim.keymap.set({ "x", "n" }, "<leader>sr", function()
	local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
	grug.open({
		transient = true,
		prefills = {
			filesFilter = ext and ext ~= "" and "*." .. ext or nil,
		},
	})
end, { desc = "Search and Replace" })
