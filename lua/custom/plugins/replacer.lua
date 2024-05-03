return {
  'gabrielpoca/replacer.nvim',
  vim.keymap.set('n', '<leader>h', ':lua require("replacer").run()<cr>', { silent = true }),
}
