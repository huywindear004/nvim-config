local M = {}

M.servers = {
        "lua-language-server",
        "html",
        "cssls",
        "jsonls", --json
        "lemminx", --xml
        "yamlls", --yaml
        "clangd", --c,c++
        "pyright", --python
        "dockerls", --dockerfile
        "rust_analyzer", --rust
        "typescript-language-server", -- Mason name
        "clojure-lsp", --clojure
}

return M
