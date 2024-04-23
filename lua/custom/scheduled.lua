-- Function to toggle scheduled date of tasks to tomorrow
function toggle_scheduled_date()
  -- Get current line
  local line = vim.fn.getline '.'

  -- Check if line contains the scheduled date
  local date_pattern = '%d%d%d%d%-%d%d%-%d%d'
  local scheduled_date = string.match(line, date_pattern)

  if scheduled_date then
    -- Convert scheduled date to a Lua date object
    local year, month, day = scheduled_date:match '(%d%d%d%d)%-(%d%d)%-(%d%d)'
    local current_date = os.time { year = tonumber(year), month = tonumber(month), day = tonumber(day) }

    -- Calculate tomorrow's date
    local tomorrow_date = os.date('%Y-%m-%d', current_date + 86400)

    -- Replace scheduled date with tomorrow's date
    local new_line = line:gsub(date_pattern, tomorrow_date)

    -- Update the line in the buffer
    vim.fn.setline('.', new_line)
  else
    print 'Scheduled date not found in line.'
  end
end

-- Mapping to trigger the toggle function
vim.api.nvim_set_keymap('n', '<leader>tom', ':lua toggle_scheduled_date()<CR>', { noremap = true, silent = true })
