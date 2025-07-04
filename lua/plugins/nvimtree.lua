return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        dofile(vim.g.base46_cache .. "nvimtree")

        local nvtree = require "nvim-tree"
        local api = require "nvim-tree.api"
        local map = vim.keymap.set

        -- Add custom mappings
        local function custom_on_attach(bufnr)
            local function opts(desc)
                return {
                    desc = "nvim-tree: " .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true,
                }
            end

            api.config.mappings.default_on_attach(bufnr)
            map("n", "<C-[>", api.tree.change_root_to_parent, opts "Up")
            map("n", "<F2>", api.fs.rename, opts "Rename")
            map("n", "?", api.tree.toggle_help, opts "Help")
        end

        nvtree.setup {
            on_attach = custom_on_attach,
            filters = {
                custom = { "^.git$" },
            },
            disable_netrw = true,
            hijack_cursor = true,
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
                update_cwd = true,
                ignore_list = {},
            },
            view = {
                width = 30,
                side = "left",
                signcolumn = "no",
                preserve_window_proportions = true,
            },
            git = {
                enable = true,
            },
            renderer = {
                indent_width = 3,
                indent_markers = {
                    enable = true,
                    icons = {
                        corner = "└",
                        edge = "│",
                        item = "├",
                        none = " ",
                    },
                },
                highlight_git = true,
                icons = {
                    glyphs = {
                        default = "󰈚",
                        folder = {
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                        },
                        git = {
                            unstaged = "",
                            staged = "",
                            unmerged = "",
                            renamed = "",
                            untracked = "",
                            deleted = "",
                            ignored = "󰴲",
                        },
                    },
                },
            },
            filesystem_watchers = {
                ignore_dirs = { ".venv", "node_modules", ".git" },
            },
        }
    end,
}
