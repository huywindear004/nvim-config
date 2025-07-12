require "nvchad.mappings"
require("nvim-surround").setup()

local map = vim.keymap.set
local cmp = require "cmp"
local line_ops = require "custom.line_ops"
-- local visual_ops = require "custom.visual_ops"
local cursor_ops = require "custom.cursor_ops"

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

map("n", "<F12>", function()
        local nvim_config_path = vim.fn.stdpath "config"
        vim.cmd("cd " .. nvim_config_path)
end, { desc = "Change directory to nvim config" })

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

-- ===========================================================================================
-- TAB & BUFFER & WINDOW
-- ===========================================================================================

-- Tab navigation:
--      * next tab: <C-A-PageDown>
--      * previous tab: <C-A-PageUp>

-- Tab ops:
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })

-- buffer navigation:
--      * next buffer: <tab>
--      * previous buffer: <S-tab>

-- buffer ops:
--      * open new buffer: <leader>b
--      * close buffer: <leader>x
-- * close all buffers: none

map("n", "<leader>fe", "<cmd>NvimTreeFindFile<CR>", { desc = "Find file in NvimTree" })

-- window resizing:
map("n", "<leader>w-", "<cmd>resize -3<CR>", { desc = "Decrease window height" })
map("n", "<leader>w=", "<cmd>resize +3<CR>", { desc = "Increase window height" })
map("n", "<leader>w,", "<cmd>vertical resize -3<CR>", { desc = "Decrease window width" })
map("n", "<leader>w.", "<cmd>vertical resize +3<CR>", { desc = "Increase window width" })

-- window navigation:
map("n", "<F6>", "<C-w>w", { desc = "Switch to next window" })

-- ===========================================================================================
-- TEXT EDITING & SELECTION
-- ===========================================================================================

-- delete a char and enter insert mode
map("n", "<BS>", "i<BS>")
map("v", "<BS>", "d")

-- Copy, Cut, Paste:
map({ "n", "i" }, "<C-c>", line_ops.copy_current_line, { desc = "Copy current line" })
map("v", "<C-c>", "y", { desc = "Copy selection" })
map({ "n", "i" }, "<C-x>", line_ops.cut_current_line, { desc = "Cut current line" })
map("v", "<C-x>", "d", { desc = "Cut selection" })
map({ "n", "i", "v" }, "<C-v>", "<cmd>normal! p<CR>", { desc = "Paste from clipboard" })

-- Word navigation:
map({ "n", "i", "v" }, "<A-l>", cursor_ops.move_to_next_word, { desc = "Move to next word" })
map({ "n", "i", "v" }, "<A-h>", cursor_ops.move_to_prev_word, { desc = "Move to previous word" })

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
map({ "n", "i" }, "<A-S-K>", "<Esc>yyPi", { desc = "Duplicate line above" })
map({ "n", "i" }, "<A-S-J>", "<Esc>yypi", { desc = "Duplicate line below" })
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
        -- vim.diagnostic.reset()
        -- vim.diagnostic.setloclist()
        -- vim.diagnostic.open_float()
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
