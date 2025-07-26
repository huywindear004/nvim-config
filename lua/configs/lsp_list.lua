local M = {}

M.lsp = {
        "html",
        "cssls",
        "jsonls", --json
        "lemminx", --xml
        "yamlls", --yaml
        "clangd", --c,c++
        "pyright", --python
        "dockerls", --dockerfile
        "rust_analyzer", --rust
        "ts_ls", -- Mason name
        "gopls", --go
}

M.dap = {
        "delve", --go debugging
}

-- Create set and convert back to array
local server_set = {}
for _, v in ipairs(M.lsp) do
        server_set[v] = true
end
for _, v in ipairs(M.dap) do
        server_set[v] = true
end

-- Convert set back to array
M.servers = {}

for server, _ in pairs(server_set) do
        table.insert(M.servers, server)
end

return M
