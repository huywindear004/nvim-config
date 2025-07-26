return {
        "petertriho/nvim-scrollbar",
        lazy = true,
        cmd = {
                "ScrollbarToggle",
        },
        keys = {
                { "<leader>st", "<cmd>ScrollbarToggle<CR>", desc = "Toggle scrollbar" },
        },
        opts = {

                handle = {
                        color = "#7c8184",
                },
        },
}
