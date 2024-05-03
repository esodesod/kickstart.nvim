local M = {}

-- Function to toggle scheduled date of tasks to tomorrow in normal mode
function M.toggle_scheduled_date_normal()
  -- Get current line number
  local line_number = vim.fn.line '.'
  local line = vim.fn.getline(line_number)

  -- Call the toggle function for a single line
  M.toggle_scheduled_date_single(line_number, line)
end

-- Function to toggle scheduled date of tasks to tomorrow in visual mode
function M.toggle_scheduled_date_visual()
  -- Get the smallest and largest line numbers in the visual selection
  local start_line = vim.fn.getpos("'<")[2]
  local end_line = vim.fn.getpos("'>")[2]

  -- Iterate over each line in the visual selection
  for line_number = start_line, end_line do
    local line = vim.fn.getline(line_number)

    -- Call the toggle function for each line
    M.toggle_scheduled_date_single(line_number, line)
  end
end

-- Function to toggle scheduled date of a single line of tasks to tomorrow
function M.toggle_scheduled_date_single(line_number, line)
  -- Check if line contains scheduled or due date
  local scheduled_date_pattern = '[⏳📅]%s*(%d%d%d%d%-%d%d%-%d%d)$'
  local scheduled_date = string.match(line, scheduled_date_pattern)

  if scheduled_date then
    -- Extract year, month, and day
    local year, month, day = scheduled_date:match '(%d%d%d%d)%-(%d%d)%-(%d%d)'

    -- Check if the extracted values are valid
    if year and month and day then
      -- Convert scheduled date to a Lua date object
      local current_date = os.time { year = tonumber(year) or 0, month = tonumber(month) or 1, day = tonumber(day) or 1 }

      -- Check if current_date is valid
      if current_date then
        -- Calculate tomorrow's date
        local tomorrow_date = os.date('%Y-%m-%d', current_date + 86400)

        -- Replace scheduled date with tomorrow's date
        local new_line = line:gsub('(%d%d%d%d%-%d%d%-%d%d)$', tomorrow_date)

        -- Update the line in the buffer
        vim.fn.setline(line_number, new_line)
      else
        print 'Invalid date components extracted from scheduled date.'
      end
    else
      print 'Invalid format for scheduled date.'
    end
  else
    print 'Scheduled or due date not found in line.'
  end
end

-- Mapping to trigger the toggle function in normal mode
vim.api.nvim_set_keymap(
  'n',
  '<leader>tom',
  ':<C-U>lua require"custom.task_scheduler".toggle_scheduled_date_normal()<CR>',
  { noremap = true, silent = true, desc = '[tom]orrow - add 1 day' }
)

-- Mapping to trigger the toggle function in visual mode
vim.api.nvim_set_keymap(
  'x',
  '<leader>tom',
  ':<C-U>lua require"custom.task_scheduler".toggle_scheduled_date_visual()<CR>',
  { noremap = true, silent = true, desc = '[tom]orrow - add 1 day' }
)

return M
