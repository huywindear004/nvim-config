local M = {}

local function insert_line_at(row)
  local ok, err = pcall(vim.api.nvim_buf_set_lines, 0, row, row, false, { "" })
  if not ok then
    vim.notify("Failed to insert line: " .. err, vim.log.levels.ERROR)
    return false
  end
  return true
end

local function get_cursor_row()
  return vim.api.nvim_win_get_cursor(0)[1]
end

local function set_cursor(row, col)
  vim.api.nvim_win_set_cursor(0, { row, col or 0 })
end

function M.insert_line_above(followed, start_insert)
  followed = followed or false
  start_insert = start_insert or false
  local original_row = get_cursor_row()

  if insert_line_at(original_row - 1) and followed then
    set_cursor(original_row) -- Move to new line
  end
  if start_insert then
    vim.cmd "startinsert"
  end
end

function M.insert_line_below(followed, start_insert)
  followed = followed or false
  start_insert = start_insert or false
  local original_row = get_cursor_row()

  if insert_line_at(original_row) and followed then
    set_cursor(original_row + 1) -- Move to new line
  end
  if start_insert then
    vim.cmd "startinsert"
  end
end

function M.move_line_down()
  vim.cmd "m .+1"
  vim.cmd "normal! =="
end

function M.move_line_up()
  vim.cmd "m .-2"
  vim.cmd "normal! =="
end

function M.copy_current_line()
  vim.cmd "normal! yy"
  vim.notify("Copied current line!")
end

return M
