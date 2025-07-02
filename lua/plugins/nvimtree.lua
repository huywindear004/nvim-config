return {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
        -- Gộp với cấu hình hiện có
        opts.renderer = opts.renderer or {}
        opts.renderer.indent_width = 3
        return opts
    end,
}
