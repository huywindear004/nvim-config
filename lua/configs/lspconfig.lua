require("nvchad.configs.lspconfig").defaults()

-- local servers = require("configs.lsp_list").servers
-- vim.lsp.enable(servers)

-- require("lspconfig").pyright.setup({
--   cmd = { "pyright-langserver", "--stdio" },
--   -- any other options like on_attach, capabilities, etc.
-- })

-- read :h vim.lsp.config for changing options of lsp servers

-- -- ============================== NEW ==============================
--
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- list of all servers configured.
lspconfig.servers = {
        "lua_ls",
}

-- list of servers configured with default config.
local default_servers = require("configs.lsp_list").servers

-- lsps with default config
for _, lsp in ipairs(default_servers) do
        lspconfig[lsp].setup {
                on_attach = on_attach,
                on_init = on_init,
                capabilities = capabilities,
        }
end

lspconfig["ts_ls"].setup {
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,

        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}

lspconfig.lua_ls.setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,

        settings = {
                Lua = {
                        diagnostics = {
                                enable = false, -- Disable all diagnostics from lua_ls
                                globals = { "vim" },
                        },
                        workspace = {
                                library = {
                                        vim.fn.expand "$VIMRUNTIME/lua",
                                        vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                                        vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
                                        vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                                        -- "${3rd}/love2d/library",
                                },
                                maxPreload = 100000,
                                preloadFileSize = 10000,
                        },
                },
        },
}
