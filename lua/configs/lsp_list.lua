local M = {}

-- Note: first element is the lsp name (use for installing), second is optional setup name

local lsp = {
        { "html" },
        { "cssls" },
        { "yamlls" }, --yaml
        { "clangd" }, --c,c++
        { "pyright" }, --python
        { "rust_analyzer" }, --rust
        { "typescript-language-server", "ts_ls" }, -- js,ts
        { "svelte-language-server", "svelte" }, --svelte
        { "tailwindcss-language-server", "tailwindcss" }, --svelte
        { "gopls" }, --go
}

local dap = {
        "delve", --go debugging
}

local linters = {
        "oxlint", -- js,ts,svelte
        "ruff", -- python
        "clangtidy", -- c,c++
        "shellcheck", -- sh,zsh
        "yamllint", -- yaml
        "hadolint", -- dockerfile
        "markdownlint", -- markdown
        "sqlfluff", -- sql
}

local function to_set(list)
        local set = {}
        for _, v in ipairs(list) do
                set[v] = true
        end
        local res = {}
        for k, _ in pairs(set) do
                table.insert(res, k)
        end
        return res
end

function M.get_to_install_servers()
        local servers = {}
        for _, v in ipairs(lsp) do
                table.insert(servers, v[1])
        end
        table.move(dap, 1, #dap, #servers + 1, servers)
        table.move(linters, 1, #linters, #servers + 1, servers)

        return to_set(servers)
end

function M.get_to_setup_servers()
        local servers = {}
        for _, v in ipairs(lsp) do
                table.insert(servers, v[2] and v[2] or v[1])
        end

        return to_set(servers)
end

return M
