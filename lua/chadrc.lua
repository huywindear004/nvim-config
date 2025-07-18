-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
        theme = "onedark",

        hl_override = {
                TbBufOn = { bg = "light_grey" },
                TbBufOnClose = { bg = "grey" },
                Comment = { italic = true },
                ["@comment"] = { italic = true },
        },

        changed_themes = {
                onedark = {
                        base_16 = {
                                base00 = "#0F0F0F",
                                base01 = "#202020",
                        },
                        base_30 = {
                                white = "#edeff0",
                                darker_black = "#060809",
                                grey = "#565c64",
                                grey_fg = "#666c73",
                                folder_bg = "#fccc77",
                        },
                        polish_hl = {
                                treesitter = {
                                        ["@punctuation.bracket"] = { fg = "#0094ff" },
                                        ["@punctuation.delimiter"] = { fg = "white" },
                                        ["@parenthesis"] = { link = "@punctuation.bracket" },

                                        ["@string"] = { fg = "#d3967d" },
                                        ["@string.escape"] = { fg = "#fccc77" },
                                        String = { fg = "#d3967d" },

                                        ["@variable.member"] = { fg = "#71b4eb" },
                                        ["@attribute"] = { link = "@variable.member" },

                                        ["@function.call"] = { fg = "#EBCB8B" },

                                        Number = { fg = "#bfd8b2" },
                                        ["@number"] = { fg = "#bfd8b2" },
                                        ["@number.float"] = { fg = "#bfd8b2" },

                                        -- ["@error"] = { fg = "red" },
                                        -- ["@type.builtin"] = { fg = "purple" },
                                        -- Typedef = { fg = "yellow" },
                                        -- Type = { fg = "yellow" },
                                        -- Structure = { fg = "yellow" },
                                },
                        },
                },
        },
}

M.nvdash = { load_on_startup = false }
M.ui = {
        tabufline = {
                lazyload = false,
        },
        telescope = {
                style = "bordered",
        },
}

return M
