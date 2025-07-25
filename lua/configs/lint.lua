local lint = require "lint"

lint.linters_by_ft = {
        -- JavaScript/TypeScript
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
        -- Python
        python = { "ruff" },
        -- C/C++
        c = { "clangtidy" },
        cpp = { "clangtidy" },
        -- Bash/Shell
        sh = { "shellcheck" },
        zsh = { "shellcheck" },
        -- YAML
        yaml = { "yamllint" },
        -- Docker
        dockerfile = { "hadolint" },
        -- Markdown
        markdown = { "markdownlint" },
        -- Lua
        lua = { "selene" }, -- or "luacheck"
        -- SQL
        sql = { "sqlfluff" },
        -- Go
        go = { "golangcilint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        callback = function()
                -- no need to lint if the buffer is not a file
                if vim.o.buftype == "" then
                        lint.try_lint()
                end
        end,
})
