return {
        "nvim-tree/nvim-tree.lua",
        config = function()
                dofile(vim.g.base46_cache .. "nvimtree")

                local nvtree = require "nvim-tree"
                local api = require "nvim-tree.api"
                local map = vim.keymap.set
                -- local visual_ops = require "custom.visual_ops"

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
                        -- map("n", "f?", function()
                        --         local is_git_ignored = nvtree.filters.git_ignored
                        --         vim.notify(
                        --                 "Git ignored: " .. (is_git_ignored and "Enabled" or "Disabled"),
                        --                 vim.log.levels.INFO
                        --         )
                        -- end, opts "Show filters status")

                        map("n", "<M-v>", api.node.open.vertical, opts "Open: Vertical Split")
                        map("n", "<M-h>", api.node.open.horizontal, opts "Open: Horizontal Split")
                        -- map("v", "J", function()
                        --         vim.notify "Last siblings in nvimtree"
                        --         api.node.navigate.sibling.last()
                        -- end, opts "Last Sibling")
                        --
                        -- map("v", "K", function()
                        --         vim.notify "First siblings in nvimtree"
                        --         api.node.navigate.sibling.first()
                        -- end, opts "First Sibling")
                        --
                        -- map("v", "m", function()
                        --         vim.notify "Toggle marking in nvimtree"
                        --         local pos = visual_ops.get_visual_selection_pos()
                        --         vim.notify(pos[1] .. " " .. pos[2] .. " " .. pos[3] .. " " .. pos[4])
                        -- end)
                end

                nvtree.setup {
                        on_attach = custom_on_attach,
                        filters = {
                                custom = { "^.git$" },
                                dotfiles = false,
                                git_ignored = false,
                        },
                        disable_netrw = true,
                        hijack_cursor = true,
                        sync_root_with_cwd = true,
                        update_focused_file = {
                                -- enable = true,
                                -- update_cwd = true,
                                ignore_list = {},
                        },
                        view = {
                                width = 25,
                                side = "left",
                                signcolumn = "no",
                                preserve_window_proportions = true,
                        },
                        git = {
                                enable = true,
                        },
                        renderer = {
                                -- root_folder_label = false,
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
                                highlight_bookmarks = "name",
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
