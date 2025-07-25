local M = {}

function M.get_visual_selection_pos()
        local _, srow, scol, _ = unpack(vim.fn.getpos "'<")
        local _, erow, ecol, _ = unpack(vim.fn.getpos "'>")
        return { srow, scol, erow, ecol }
end

local function escape_for_substitute(text)
        -- Escape backslashes, forward slashes, and special regex characters
        text = text:gsub("\\", "\\\\")
                :gsub("/", "\\/")
                :gsub(" ", "\\s")
                :gsub("\n", "\\n")
                :gsub("\\", "\\")
                :gsub('"', '\\"')
                :gsub("'", "\\'")
                :gsub("%.", "\\.")
                :gsub("%*", "\\*")
                :gsub("%^", "\\^")
                :gsub("%$", "\\$")
                :gsub("%[", "\\[")
                :gsub("%]", "\\]")
                :gsub("%-", "\\-")
        return text
end

function M.get_visual_selection_text()
        -- Save current default register
        local saved_reg = vim.fn.getreg '"'
        local saved_type = vim.fn.getregtype '"'

        -- Yank visual selection to register v
        vim.cmd [[noau normal! "vy]]

        local text = vim.fn.getreg "v"
        vim.fn.setreg("v", {}) -- clear it

        -- Restore default register
        vim.fn.setreg('"', saved_reg, saved_type)

        if text and #text > 0 then
                return escape_for_substitute(text)
        else
                return ""
        end
end

return M
