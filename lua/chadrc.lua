-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
        theme = "onedark",

        hl_override = {
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
