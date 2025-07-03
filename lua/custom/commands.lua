local api = vim.api

api.nvim_create_user_command("CDcfg", function()
    local nvim_config_path = vim.fn.stdpath "config"
    vim.cmd("cd " .. nvim_config_path)
end, { desc = "Change directory to Neovim config folder" })

api.nvim_create_user_command("Ex", function()
    vim.cmd("silent !explorer /select," .. vim.fn.expand "%:p")
end, { desc = "Open file explorer" })

api.nvim_create_user_command("CDbuf", function()
    local current_buffer_path = vim.fn.expand "%:p:h"
    vim.cmd("cd " .. current_buffer_path)
end, { desc = "Change directory to current buffer's path" })
