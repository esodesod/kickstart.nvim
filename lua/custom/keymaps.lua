-- buffers
vim.keymap.set('n', '<C-n>', ':bnext<enter>', { desc = 'next buffer' })
vim.keymap.set('n', '<C-p>', ':bprev<enter>', { desc = 'previous buffer' })
vim.keymap.set('n', 'bd', ':bdelete<enter>', { desc = '[b]uffer [d]elete' })
vim.keymap.set('n', 'bD', ':bdelete!<enter>', { desc = '[b]uffer [D]elete!' })

-- tabs
vim.keymap.set('n', 'H', ':tabprev<enter>', { desc = 'previous tab' })
vim.keymap.set('n', 'L', ':tabnext<enter>', { desc = 'next tab' })
vim.keymap.set('n', 'tn', ':tabnew <cr>', { desc = '[t]ab [n]ew' })
vim.keymap.set('n', 'tc', ':tabclose <cr>', { desc = '[t]ab [c]lose' })

-- window
vim.keymap.set('n', '-', ':new<cr>', { desc = '[n]ew window' })
vim.keymap.set('n', '|', ':vnew<cr>', { desc = '[v]ertical [n]ew split window' })

-- jump around
vim.keymap.set('n', 'gd', '<C-]>', { desc = 'Jump to the [d]efinition of the keyword under the cursor' })

-- terminal
vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { desc = 'Escape terminal mode' })
vim.keymap.set('n', 'tt', ':tabnew +term<enter>', { desc = 'tabnew +term' })
vim.keymap.set('n', 'th', ':split +term<enter>', { desc = 'split +term' })
vim.keymap.set('n', 'tv', ':vsplit +term<enter>', { desc = 'vsplit +term' })

-- macbooks without ESC key, brilliant
vim.keymap.set('i', 'jk', '<esc>', { desc = 'escape key' })
vim.keymap.set('i', 'jj', '<esc>', { desc = 'escape key' })
