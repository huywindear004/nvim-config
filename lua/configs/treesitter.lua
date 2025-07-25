local options = {
    ensure_installed = {
        "bash",
        "luadoc",
        "markdown",
        "toml",
        "vim",
        "lua",
        "vimdoc",
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
        "typescript",
        "tsx",
        "go",
        "gomod",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
