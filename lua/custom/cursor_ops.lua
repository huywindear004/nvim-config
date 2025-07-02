local M = {}

function M.move_to_next_word()
    vim.cmd "normal! w"
end

function M.move_to_prev_word()
    vim.cmd "normal! b"
end

return M
