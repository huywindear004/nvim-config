local M = {}

M.servers = {
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
}

return M
