return {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
                "neovim/nvim-lspconfig",
                "mfussenegger/nvim-dap",
                "mfussenegger/nvim-dap-python", --optional
                { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        },
        branch = "regexp", -- This is the regexp branch, use this for the new version
        keys = {
                { ",v", "<cmd>VenvSelect<cr>", desc = "Open venv selector" },
        },
        ---@type venv-selector.Config
        opts = {
                -- Your settings go here
                name = {"venv", ".venv"}
        },
}
