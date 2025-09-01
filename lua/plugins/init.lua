return {
        {
                "stevearc/conform.nvim",
                -- event = 'BufWritePre', -- uncomment for format on save
                config = function()
                        require "configs.conform"
                end,
        },

        {
                "williamboman/mason.nvim",
                -- opts = {
                --         ensure_installed = require("configs.lsp_list").servers,
                -- },
        },

        {
                "jay-babu/mason-null-ls.nvim",
                event = "VeryLazy",
                dependencies = {
                        "williamboman/mason.nvim",
                        "nvimtools/none-ls.nvim",
                },
                config = function()
                        require("mason-null-ls").setup {
                                -- ensure_installed = require("configs.lsp_list").get_to_install_servers(),
                        }
                end,
        },

        -- These are some examples, uncomment them if you want to see them work!
        {
                "neovim/nvim-lspconfig",
                config = function()
                        require "configs.lspconfig"
                end,
        },

        -- test new blink
        -- { import = "nvchad.blink.lazyspec" },

        {
                "mfussenegger/nvim-lint",
                event = { "BufReadPre", "BufNewFile" },
                config = function()
                        require "configs.lint"
                end,
        },

        {
                "nvim-treesitter/nvim-treesitter",
                -- event = { "BufReadPre", "BufNewFile" },
                config = function()
                        require "configs.treesitter"
                end,
        },

        {
                "indent-blankline.nvim",
                enabled = false,
        },
}
