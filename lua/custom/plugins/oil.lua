return {
  -- Oil
  'stevearc/oil.nvim',
  opts = {
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
      natural_order = true,
      sort = {
        -- sort order can be "asc" or "desc"
        -- see :help oil-columns to see which columns are sortable
        { 'type', 'asc' },
        { 'name', 'asc' },
      },
    },
  },
}
