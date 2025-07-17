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
                ["@punctuation.bracket"] = { fg = "#0281e3" },
                ["@punctuation.delimiter"] = { fg = "white" },
                ["@parenthesis"] = { link = "@punctuation.bracket" },
                ["@string"] = { fg = "#d3967d" },
                String = { fg = "#d3967d" },
                ["@variable.member"] = { fg = "blue" },

                ["@function.call"] = { fg = "yellow" },

                Number = { fg = "#bfd8b2" },
                ["@number"] = { fg = "#bfd8b2" },
                ["@number.float"] = { fg = "#bfd8b2" },
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
