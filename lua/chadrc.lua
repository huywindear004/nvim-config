-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
        theme = "onedark",

        hl_override = {
                TbBufOn = { bg = "#6a6a6a" },
                TbBufOnClose = { bg = "red", fg = "white" },
                TbBufOffClose = { bg = "#660000", fg = "white" },
                Comment = { italic = true, fg = "#878e96" },
                ["@comment"] = { italic = true, fg = "#878e96" },

                NvimTreeCursorLine = { bg = "#3a3a3a" },
                NvimTreeNormal = { bg = "#000000" },
                NvimTreeNormalNC = { bg = "#000000" },
                NvimTreeRootFolder = { fg = "#C586C0", bold = true },
                NvimTreeIndentMarker = { fg = "#878e96" },

                CursorLine = { bg = "#3a3a3a" },
                LineNr = { fg = "#878e96" },

                DiagnosticWarn = { bg = "#363601" },
                DiagnosticError = { bg = "#450101" },
                DiagnosticInfo = { bg = "#082340" },
                DiagnosticHint = { bg = "#4a164f" },

                IblChar = { fg = "#6a6a6a" },
        },

        changed_themes = {
                onedark = {
                        base_16 = {
                                base00 = "#0F0F0F",
                                -- base01 = "#202020",
                        },
                        base_30 = {
                                white = "#edeff0",
                                folder_bg = "#fccc77",
                        },
                        polish_hl = {
                                treesitter = {
                                        ["@punctuation.bracket"] = { fg = "yellow" },
                                        ["@punctuation.delimiter"] = { fg = "white" },

                                        ["@string"] = { fg = "#d3967d" },
                                        ["@string.escape"] = { fg = "#fccc77" },
                                        String = { fg = "#d3967d" },

                                        ["@keyword.import"] = { fg = "#C586C0" },
                                        -- ["@keyword.repeat"] = { fg = "#C586C0" },
                                        ["@keyword.function"] = { fg = "#2f94eb" },
                                        ["@keyword.operator"] = { fg = "#2f94eb" },

                                        ["@variable"] = { fg = "#a1d0f7" },
                                        ["@variable.member"] = { fg = "#a1d0f7" },
                                        ["@attribute"] = { link = "@variable.member" },

                                        ["@constant"] = { fg = "#60a6e0" },
                                        Boolean = { fg = "#2f94eb" },
                                        ["@type.builtin"] = { fg = "#2f94eb" },

                                        ["@function"] = { fg = "#EBCB8B" },
                                        ["@function.call"] = { fg = "#EBCB8B" },
                                        ["@function.macro"] = { fg = "#2f94eb" },
                                        ["@function.builtin"] = { fg = "#EBCB8B" },
                                        ["@function.method"] = { fg = "#EBCB8B" },
                                        ["@function.method.call"] = { fg = "#EBCB8B" },

                                        Number = { fg = "#bfd8b2" },
                                        ["@number"] = { fg = "#bfd8b2" },
                                        ["@number.float"] = { fg = "#bfd8b2" },

                                        ["@operator"] = { fg = "white" },

                                        ["@annotation"] = { fg = "purple" },

                                        Type = { fg = "#4EC994" },

                                        ["@module"] = { fg = "#4EC994" },
                                        ["@constructor"] = { fg = "#4EC994" },
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
