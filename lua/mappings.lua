require "nvchad.mappings"
require("nvim-surround").setup()

local map = vim.keymap.set
local cmp = require "cmp"
local line_ops = require "custom.line_ops"
local visual_ops = require "custom.visual_ops"
local cursor_ops = require "custom.cursor_ops"

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
map("i", "JK", "<Esc>", { desc = "Exit insert mode with JK" })

-- map("n", "<F12>", function()
--         local nvim_config_path = vim.fn.stdpath "config"
--         vim.cmd("cd " .. nvim_config_path)
-- end, { desc = "Change directory to nvim config" })

map("n", "<F12>", function()
        if vim.fn.exists ":NvimTreeClose" > 0 then
                vim.cmd "NvimTreeClose"
        end
        vim.cmd "Spaceport"
end, { desc = "Open Spaceport" })

map("n", "K", function()
        vim.lsp.buf.hover {
                border = "single",
        }
end)

-- ===========================================================================================
-- EDITOR & UI
-- ===========================================================================================

-- toggle number: <leader>n

-- toggle relative number: <leader>rn

map("n", "<leader>ww", "<cmd>set wrap!<CR>", { desc = "Toggle word wrap" })

map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

map("i", "<M-b>", cmp.mapping.complete { reason = cmp.ContextReason.Auto })

map({ "n", "i" }, "<M-B>", function()
        vim.lsp.buf.signature_help {
                border = "single",
        }
end, { desc = "Show signature help" })

map({ "n", "v" }, ",rb", "<Esc>:%s/", {
        desc = "Replace in buffer",
})

map("n", ",rw", function()
        local word = vim.fn.expand "<cword>"
        if word == "" then
                vim.notify("No word under cursor", vim.log.levels.INFO)
                return
        end
        vim.api.nvim_feedkeys(":%s/" .. word, "n", false)
end, {
        desc = "Replace the current word",
})

map("v", ",rs", function()
        local selection = visual_ops.get_visual_selection_text()
        vim.api.nvim_feedkeys(":%s/" .. selection, "n", false)
end, {
        desc = "Replace selection in buffer",
})

map("v", ",ri", ":s/", {
        desc = "Replace in selection",
})

map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
        desc = "Toggle Spectre",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = "Search current word",
})
map("n", "<leader>sb", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = "Search on current file",
})

map({ "n", "i", "v" }, "<M-9>", "<cmd>normal! 3zh<CR>", { desc = "Scroll left 3 columns" })
map({ "n", "i", "v" }, "<M-0>", "<cmd>normal! 3zl<CR>", { desc = "Scroll right 3 columns" })

-- ===========================================================================================
-- TAB & BUFFER & WINDOW
-- ===========================================================================================

-- Tab navigation:
--      * next tab: <C-A-PageDown>
--      * previous tab: <C-A-PageUp>
map("n", ",q", "<cmd>tabprevious<CR>", { desc = "Go to previous tab" })
map("n", ",e", "<cmd>tabnext<CR>", { desc = "Go to next tab" })

-- Tab ops:
map("n", ",t", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", ",x", "<cmd>tabclose<CR>", { desc = "Close current tab" })

-- buffer navigation:
--      * next buffer: <tab>
--      * previous buffer: <S-tab>

-- buffer ops:
--      * open new buffer: <leader>b
--      * close buffer: <leader>x
-- * close all buffers: none

map("n", "<leader>fe", "<cmd>NvimTreeFindFile<CR>", { desc = "Find file in NvimTree" })

-- window resizing:
map("n", ",s", "<cmd>resize -5<CR>", { desc = "Decrease window height" })
map("n", ",w", "<cmd>resize +5<CR>", { desc = "Increase window height" })
map("n", ",a", "<cmd>vertical resize -5<CR>", { desc = "Decrease window width" })
map("n", ",d", "<cmd>vertical resize +5<CR>", { desc = "Increase window width" })

-- window navigation:
map("n", "<F6>", "<C-w>w", { desc = "Switch to next window" })

-- tab moving:
map("n", ",T", function()
        require("nvchad.term").new { pos = "sp" }
        local keys = vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>T", true, false, true)
        vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Open new terminal in new tab" })

map("n", ",,", "<cmd>tabmove -1<CR>", { desc = "Move current tab to the left" })

map("n", ",.", "<cmd>tabmove +1<CR>", { desc = "Move current tab to the right" })

-- ===========================================================================================
-- TEXT EDITING & SELECTION
-- ===========================================================================================

-- delete a char and enter insert mode
map("n", "<BS>", "i<BS>")
map("v", "<BS>", '"_d', { desc = "Delete selection and enter insert mode" })

-- Copy, Cut, Paste:
map({ "n", "i" }, "<C-c>", line_ops.copy_current_line, { desc = "Copy current line" })
map("v", "<C-c>", "ygv", { desc = "Copy selection" })
map({ "n", "i" }, "<C-x>", line_ops.cut_current_line, { desc = "Cut current line" })
map("v", "<C-x>", "d", { desc = "Cut selection" })
map({ "n", "i", "v" }, "<C-v>", "<cmd>normal! p<CR>", { desc = "Paste from clipboard" })

-- Word navigation:
map({ "n", "i", "v" }, "<M-l>", cursor_ops.move_to_next_word, { desc = "Move to next word" })
map({ "n", "i", "v" }, "<M-h>", cursor_ops.move_to_prev_word, { desc = "Move to previous word" })

-- Word deletion:
map("i", "<A-w>", cursor_ops.delete_next_word)

-- New line above/below (insert mode):
-- !!!!!!!! Ctrl + Enter might not work in some terminals
--      * above: <A-O>
--      * below: <A-o>
map("n", "<A-o>", function()
        line_ops.insert_line_below(true, false)
        vim.cmd "normal! =="
end, { desc = "Insert new line below without enter insert mode" })
map("n", "<A-O>", function()
        line_ops.insert_line_above(true, false)
        vim.cmd "normal! =="
end, { desc = "Insert new line above without enter insert mode" })

-- Duplicate line(s):
local selectLatestYankCommand = "`[v`]"
-- map("i", "<A-S-K>", "<Esc>yyPi", { desc = "Duplicate line above" })
-- map("i", "<A-S-J>", "<Esc>yypi", { desc = "Duplicate line below" })

map({ "n", "i" }, "<A-S-K>", "<cmd>normal! yyP<CR>", { desc = "Duplicate line above" })
map({ "n", "i" }, "<A-S-J>", "<cmd>normal! yyp<CR>", { desc = "Duplicate line below" })

map("v", "<A-S-K>", function()
        vim.cmd "normal! y`["
        line_ops.insert_line_above(true, false)
        vim.cmd("normal! p" .. selectLatestYankCommand)
end, { desc = "Duplicate selection lines above" })
map("v", "<A-S-J>", function()
        vim.cmd "normal! y`]"
        line_ops.insert_line_below(true, false)
        vim.cmd("normal! p" .. selectLatestYankCommand)
end, { desc = "Duplicate selection lines below" })

-- Move line(s) up/down:
map({ "n", "i" }, "<A-j>", line_ops.move_line_down, { desc = "Move line down" })
map({ "n", "i" }, "<A-k>", line_ops.move_line_up, { desc = "Move line up" })
-- some how i cant use the respective function in visual mode
-- so i use the same logic
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- select all
map({ "n", "v", "i" }, "<C-a>", "<Esc>ggVG")

-- delete line
map({ "n", "i", "v" }, "<F4>", function()
        local mode = vim.fn.mode()
        if mode == "V" then
                vim.cmd 'normal! "_d'
        else
                vim.cmd 'normal! V"_d'
        end
end, { desc = "Delete line(s)" })

-- indent line(s):
map({ "n", "i" }, "<M-]>", line_ops.indent_line, { desc = "Indent line(s) in insert mode" })
map({ "n", "i" }, "<M-[>", line_ops.outdent_line, { desc = "Outdnet line(s) in insert mode" })
map("v", "<M-]>", "<S->>gv", { desc = "Indent line(s) in insert mode" })
map("v", "<M-[>", "<S-<>gv", { desc = "outdent line(s) in insert mode" })

-- ===========================================================================================
-- COMMENTING
-- ===========================================================================================

-- comment (Ctrl + /)
map({ "n", "i" }, "<C-_>", "<cmd>normal gcc<CR>", { desc = "Toggle comment" })

map("v", "<C-_>", "gc", { desc = "Toggle comment", remap = true })
-- ===========================================================================================
-- DIAGNOSTICS
-- ===========================================================================================

-- show diagnostics
map({ "n", "i", "v" }, "<M-I>", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- refresh diagnostics
map({ "n", "i" }, "<F5>", function()
        require("lint").try_lint()
end, { desc = "Refresh diagnostics" })

-- ===========================================================================================
-- FILE IO
-- ===========================================================================================

-- save file
map({ "n", "v", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- format file
map({ "n", "v", "i" }, "<A-S-F>", function()
        require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- undo,redo
map({ "n", "v", "i" }, "<C-z>", "<cmd>undo<CR>", { desc = "Undo" })
map({ "n", "v", "i" }, "<C-y>", "<cmd>redo<CR>", { desc = "Redo" })

-- open current buffer in file explorer
map({ "n", "i" }, "<F7>", "<cmd>Oie<CR>", { desc = "Open current buffer in file explorer" })

-- ===========================================================================================
-- TERMINAL
-- ===========================================================================================
map({ "n", "t" }, "<F9>", function()
        require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

-- terminal normal mode (nvchad map it to C-x)
map("t", "<A-e>", "<C-\\><C-n>", { desc = "Enter normal mode in terminal" })
