require "nvchad.mappings"
require("Comment").setup()
require("nvim-surround").setup()

-- add yours here
local cmp = require "cmp"
local line_ops = require "custom.line_ops"
local visual_ops = require "custom.visual_ops"
local cursor_ops = require "custom.cursor_ops"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- New Keybindings
-- cd to nvim config folder
map("n", "<F12>", function()
    local nvim_config_path = vim.fn.stdpath "config"
    vim.cmd("cd " .. nvim_config_path)
end)

map("n", "<leader>rs", function()
    local bounds = visual_ops.get_visual_selection()
    visual_ops.restore_visual_selection(bounds)
end, { desc = "Restore latest selection" })

map({ "n", "i" }, "<F2>", vim.diagnostic.open_float)

map("n", "<F3>", "<cmd>!explorer /select,%:p<CR>", { desc = "Open in explorer" })

-- delete line
map({ "n", "i" }, "<F4>", '<cmd>normal! "_dd<CR>', { desc = "Delete line" })
map("v", "<F4>", 'V"_d')

map("n", "<F6>", "<C-w>w", { desc = "Switch to next window" })

map({ "n", "i" }, "<F8>", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

map({ "n", "i" }, "<F10>", cmp.mapping.complete { reason = cmp.ContextReason.Auto })

-- switch tab
-- map({ "n", "i", "v" }, "<C-PageDown>", function()
--   require("nvchad.tabufline").next()
-- end, { desc = "buffer goto next" })
--
-- map({ "n", "i", "v" }, "<C-PageUp>", function()
--   require("nvchad.tabufline").prev()
-- end, { desc = "buffer goto prev" })

map({ "n", "i", "v" }, "<C-F4>", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- save
map({ "n", "v", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- delete a char and enter insert mode
map("n", "<BS>", "i<BS>")
map("v", "<BS>", "d")

-- format in insert
map({ "n", "v", "i" }, "<A-S-F>", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- undo,redo
map({ "n", "v", "i" }, "<C-z>", "<cmd>undo<CR>")
map({ "n", "v", "i" }, "<C-y>", "<cmd>redo<CR>")

-- add new line below,above
-- !!!!!! use A-o and A-O instead of these (insert mode)
-- map({ "n", "i" }, "<C-CR>", function()
--     line_ops.insert_line_below(true, true)
-- end)
-- map({ "n", "i" }, "<C-S-CR>", function()
--     line_ops.insert_line_above(true, true)
-- end)

-- select all
map("n", "<C-a>", "ggVG")
map({ "v", "i" }, "<C-a>", "<Esc>ggVG")

-- copy line to above/below
local selectLatestYankCommand = "`[v`]"
map({ "n", "i" }, "<A-S-K>", "<Esc>yyPi")
map({ "n", "i" }, "<A-S-J>", "<Esc>yypi")
map("v", "<A-S-K>", "Vy`[<C-S-CR><Up><Esc>p" .. selectLatestYankCommand)
map("v", "<A-S-J>", "Vy`]p" .. selectLatestYankCommand)

-- Move line up/down
map({ "n", "i" }, "<A-j>", line_ops.move_line_down, { desc = "Move line down" })
map({ "n", "i" }, "<A-k>", line_ops.move_line_up, { desc = "Move line up" })
-- some how i cant use the same function in visual mode
-- so i use the same logic
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- terminal normal mode (nvchad map it to C-x)
map("t", "<A-e>", "<C-\\><C-n>")

-- tab navigation
-- Note that: Ctrl + Alt + PageUp/Down is already set
map({ "n", "v", "i" }, "<C-t>", "<cmd>tabnew<CR>")
map({ "n", "v", "i" }, "<C-S-F4>", "<cmd>tabclose<CR>")

-- comment in insert mode
map({ "n", "i" }, "<C-_>", function()
    require("Comment.api").toggle.linewise.current()
end)

map({ "n", "i" }, "<C-c>", line_ops.copy_current_line)
map("v", "<C-c>", "y")
map({ "n", "i" }, "<C-x>", line_ops.cut_current_line)
map("v", "<C-x>", "d")
map({ "n", "i", "v" }, "<C-v>", "<cmd>normal! p<CR>", { desc = "Paste from clipboard" })

map({ "n", "i", "v" }, "<A-l>", cursor_ops.move_to_next_word)
map({ "n", "i", "v" }, "<A-h>", cursor_ops.move_to_prev_word)

map("i", "<A-w>", cursor_ops.delete_next_word)

map({ "n", "t" }, "<C-j>", function()
    require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
