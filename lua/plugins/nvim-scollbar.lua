return {
        "petertriho/nvim-scrollbar",
        -- event = "VeryLazy",
        config = function()
                require("scrollbar").setup {
                        handle = {
                                color = "#7c8184",
                        },
                }
        end,
}
