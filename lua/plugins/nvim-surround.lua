-- ===== Usage =====
-- https://github.com/kylechui/nvim-surround?tab=readme-ov-file#rocket-usage

return {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
                require("nvim-surround").setup {
                        -- Configuration here, or leave empty to use defaults
                }
        end,
}
