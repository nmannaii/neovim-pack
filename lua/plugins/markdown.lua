-- require("render-markdown").setup({
-- 	heading = {
-- 		min_width = 30,
-- 		bordure = true,
-- 		border_virtual = true,
-- 	},
-- })

local presets = require("markview.presets").headings
require("markview").setup({})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown preview toggle" })
	end,
})
