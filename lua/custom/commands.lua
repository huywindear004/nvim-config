local create_user_command = vim.api.nvim_create_user_command

create_user_command("CDcfg", function()
    local nvim_config_path = vim.fn.stdpath "config"
    vim.cmd("cd " .. nvim_config_path)
end, { desc = "Change directory to Neovim config folder" })

create_user_command("Oie", function()
    local path
    if vim.bo.filetype == "NvimTree" then
        path = require("nvim-tree.api").tree.get_node_under_cursor().absolute_path
        print "You are inside nvim-tree"
    else
        path = vim.fn.expand "%:p"
        print "You are in a normal buffer"
    end

    vim.cmd("silent !explorer /select," .. path)
end, { desc = "Open file explorer" })

create_user_command("CDbuf", function()
    local current_buffer_path = vim.fn.expand "%:p:h"
    vim.cmd("cd " .. current_buffer_path)
end, { desc = "Change directory to current buffer's path" })
