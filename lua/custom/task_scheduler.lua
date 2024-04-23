local M = {}

-- Function to toggle scheduled date of tasks to tomorrow
function M.toggle_scheduled_date()
  -- Get current line number
  local current_line_number = vim.api.nvim_win_get_cursor(0)[1]
  -- Get current line
  local line = vim.fn.getline '.'

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
        vim.fn.setline(current_line_number, new_line)
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

-- Mapping to trigger the toggle function
vim.api.nvim_set_keymap('n', '<leader>tom', ':lua require"custom.task_scheduler".toggle_scheduled_date()<CR>', { noremap = true, silent = true })

return M
