return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        mode = 'tabs', -- use "buffers" (default) or "tabs" for tabpages only instead.
      },
    }
    vim.keymap.set('n', '<Tab>h', ':BufferLineCyclePrev<CR>', { desc = 'bufferline cycle previous' })
    vim.keymap.set('n', '<Tab>l', ':BufferLineCycleNext<CR>', { desc = 'bufferline cycle next' })
  end,
}
