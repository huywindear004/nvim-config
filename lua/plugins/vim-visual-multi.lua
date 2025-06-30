return {
  "mg979/vim-visual-multi",
  lazy = false,
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>", -- " replace C-n
      ["Find Subword Under"] = "<C-d>", -- " replace visual C-n
      ["Select Cursor Down"] = "<M-C-Down>", -- " start selecting down
      ["Select Cursor Up"] = "<M-C-Up>", -- " start selecting up
      ["Select All"] = "\\A",
      ["Switch Mode"] = "<Tab>",
    }
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
  end,
}
