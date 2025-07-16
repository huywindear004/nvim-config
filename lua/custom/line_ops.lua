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
        vim.notify "Copied current line!"
end

function M.cut_current_line()
        vim.cmd "normal! dd"
        vim.notify "Cut current line!"
end

function M.indent_line()
        local mode = vim.api.nvim_get_mode().mode
        local ctrl_t = vim.api.nvim_replace_termcodes("<c-t>", true, true, true)
        local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
        local a = vim.api.nvim_replace_termcodes("a", true, true, true)
        if mode:match "i" then
                -- Already in insert mode: just feed <C-t>
                vim.api.nvim_feedkeys(ctrl_t, "n", false)
        else
                -- In normal mode: enter insert-after, then <C-t>, then <Esc>
                vim.api.nvim_feedkeys(a .. ctrl_t .. esc, "n", false)
        end
end

function M.outdent_line()
        local mode = vim.api.nvim_get_mode().mode
        local ctrl_d = vim.api.nvim_replace_termcodes("<c-d>", true, true, true)
        local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
        local a = vim.api.nvim_replace_termcodes("a", true, true, true)
        if mode:match "i" then
                -- Already in insert mode: just feed <C-t>
                vim.api.nvim_feedkeys(ctrl_d, "n", false)
        else
                -- In normal mode: enter insert-after, then <C-t>, then <Esc>
                vim.api.nvim_feedkeys(a .. ctrl_d .. esc, "n", false)
        end
end

return M
