local options = {
        ensure_installed = {
                "bash",
                "luadoc",
                "markdown",
                "toml",
                "lua",
                "html",
                "css",
                "json",
                "xml",
                "yaml",
                "c",
                "cpp",
                "python",
                "dockerfile",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "java",
                "rust",
                "sql",
                "javascript",
                "svelte",
                "typescript",
                "tsx",
                "go",
                "gomod",
                "regex",
        },

        highlight = {
                enable = true,
                use_languagetree = true,
        },

        indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
