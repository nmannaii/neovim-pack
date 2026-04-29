require('render-markdown').setup({})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function ()
    vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", {desc = "Markdown preview toggle"})
  end
})

