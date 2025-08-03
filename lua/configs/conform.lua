local options = {
        formatters_by_ft = {
                lua = { "stylua" },
                css = { "biome" },
                html = { "prettier" },
                javascript = { "biome" },
                javascriptreact = { "biome" },
                typescript = { "biome" },
                typescriptreact = { "biome" },
                json = { "biome" },
                svelte = { "biome" },
                markdown = { "prettier" },
                yaml = { "prettier" },
                python = {
                        -- To fix auto-fixable lint errors.
                        "ruff_fix",
                        -- To run the Ruff formatter.
                        "ruff_format",
                        -- To organize the imports.
                        "ruff_organize_imports",
                },
                go = { "gofumpt" },
        },

        -- format_on_save = {
        --   -- These options will be passed to conform.format()
        --   timeout_ms = 500,
        --   lsp_fallback = true,
        -- },
}

require("conform").setup(options)
