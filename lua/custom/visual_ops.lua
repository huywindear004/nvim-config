local M = {}

function M.get_visual_selection()
  local _, srow, scol, _ = unpack(vim.fn.getpos "'<")
  local _, erow, ecol, _ = unpack(vim.fn.getpos "'>")
  return { srow, scol, erow, ecol }
end

function M.restore_visual_selection(bounds)
  vim.cmd('noautocmd silent normal! ' .. bounds[1] .. 'G' .. bounds[2] .. '|v' .. bounds[3] .. 'G' .. bounds[4] .. '|')
end

return M
