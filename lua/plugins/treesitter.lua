require('nvim-treesitter').setup { }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'typescript', 'html', 'htmlangular', 'javascript', 'cs' },
  callback = function() vim.treesitter.start() end,
})
