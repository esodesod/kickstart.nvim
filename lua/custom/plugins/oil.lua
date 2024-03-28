return {
  {
    -- Oil
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        -- This function defines what is considered a "hidden" file
        -- H       is_hidden_file = function(name, bufnr)     ■ Unused local `bufnr`.
        --           return vim.startswith(name, '.')
        --         end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        -- H       is_always_hidden = function(name, bufnr)     ■■ Unused local `bufnr`.
        --           return false
        --         end,
        -- Sort file names in a more intuitive order for humans. Is less performant,
        -- so you may want to set to false if you work with large directories.
        natural_order = true,
        sort = {
          -- sort order can be "asc" or "desc"
          -- see :help oil-columns to see which columns are sortable
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
      },
    },
  },
}
