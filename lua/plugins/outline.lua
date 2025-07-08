return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = "Outline",
    config = function()
        require("outline").setup {
            -- Your setup opts here (leave empty to use defaults)
            outline_window = {
                position = "botright",
            },
    }
    end,
}
