return {
  'gabrielpoca/replacer.nvim',
  vim.keymap.set('n', '<leader>R', ':lua require("replacer").run()<cr>', { desc = 'Activate [R]eplacer for quickfix', silent = true }),
}
