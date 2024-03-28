-- jump around go to definition
-- vim.keymap.set('n', 'gd', "<C-]>", { desc = 'Jump around' })

-- terminal
vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { desc = 'Escape terminal mode' })
vim.keymap.set('n', 'tt', ':tabnew +term<enter>', { desc = 'tabnew +term' })
vim.keymap.set('n', 'th', ':split +term<enter>', { desc = 'split +term' })
vim.keymap.set('n', 'tv', ':vsplit +term<enter>', { desc = 'vsplit +term' })

-- navigate and edit buffers
vim.keymap.set('n', 'tk', ':bnext<enter>', { desc = 'Buffer Next' })
vim.keymap.set('n', 'tj', ':bprev<enter>', { desc = 'Buffer Previous' })
vim.keymap.set('n', 'td', ':bdelete<enter>', { desc = 'Buffer Delete' })

-- window
vim.keymap.set('n', '-', ':new<cr>', { desc = '[n]ew window' })
vim.keymap.set('n', '|', ':vnew<cr>', { desc = '[v]ertical [n]ew split window' })
