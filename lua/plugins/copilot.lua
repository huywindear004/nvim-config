return {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
                require("copilot").setup {
                        suggestion = {
                                enabled = true,
                                auto_trigger = false,
                                hide_during_completion = true,
                                debounce = 150,
                                trigger_on_accept = true,
                                keymap = {
                                        accept = "<M-s>",
                                        accept_word = false,
                                        accept_line = false,
                                        next = "<C-M-]>",
                                        prev = "<C-M-[>",
                                        dismiss = "<M-d>",
                                },
                        },
                }
        end,
}
