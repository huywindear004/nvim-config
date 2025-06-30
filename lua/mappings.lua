require "nvchad.mappings"
require("Comment").setup()
require("nvim-surround").setup()
-- add yours here
local line_ops = require "custom.line_ops"
local visual_ops = require "custom.visual_ops"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- New Keybindings

-- cd to nvim config folder
map("n", "<F12>", function()
  local nvim_config_path = vim.fn.stdpath "config"
  vim.cmd("cd " .. nvim_config_path)
end)

map("n", "<F8>", function()
  local bounds = visual_ops.get_visual_selection()
  visual_ops.restore_visual_selection(bounds)
end)

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

-- delete line
map("i", "<F4>", '<C-o>"_dd', { desc = "Delete line without yank (insert)" })
map("n", "<F4>", "_dd")
map("v", "<F4>", "Vd")

-- format in insert
map({ "n", "v", "i" }, "<A-S-F>", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- undo,redo
map({ "n", "v", "i" }, "<C-z>", "<cmd>undo<CR>")
map({ "n", "v", "i" }, "<C-y>", "<cmd>redo<CR>")

-- add new line below, above
map({ "n", "i" }, "<C-CR>", function()
  line_ops.insert_line_below(true, true)
end)
map({ "n", "i" }, "<C-S-CR>", function()
  line_ops.insert_line_above(true, true)
end)

-- select all
map("n", "<C-a>", "ggVG")
map({ "v", "i" }, "<C-a>", "<Esc>ggVG")

-- copy line to above/below
local selectLatestYankCommand = "`[v`]"
map({ "n", "i" }, "<A-S-Up>", "<Esc>yyPi")
map({ "n", "i" }, "<A-S-Down>", "<Esc>yypi")
map("v", "<A-S-Up>", "Vy`[<C-S-CR><Up><Esc>p" .. selectLatestYankCommand)
map("v", "<A-S-Down>", "Vy`]p" .. selectLatestYankCommand)

-- Move line up/down
map({ "n", "i" }, "<A-Down>", line_ops.move_line_down, { desc = "Move line down" })
map({ "n", "i" }, "<A-Up>", line_ops.move_line_up, { desc = "Move line up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- terminal normal mode (nvchad map it to C-x)
-- map("t", "<F4>", "<C-\\><C-n>")

-- tab navigation
-- Note that: Ctrl + Alt + PageUp/Down is already set
map({ "n", "v", "i" }, "<C-t>", "<cmd>tabnew<CR>")
map({ "n", "v", "i" }, "<C-S-F4>", "<cmd>tabclose<CR>")

-- comment in insert mode
map({ "n", "i" }, "<C-_>", function()
  require("Comment.api").toggle.linewise.current()
end)

map({ "n", "i" }, "<C-c>", line_ops.copy_current_line)

map({ "n", "i" }, "<F2>", vim.diagnostic.open_float)

map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
