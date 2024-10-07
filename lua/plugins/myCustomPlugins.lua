return {

    {
        "olrtg/nvim-emmet",
        config = function()
            vim.keymap.set({ "n", "v" }, "<leader>wp", require("nvim-emmet").wrap_with_abbreviation)
        end,
    },

    { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },

    {
        "brianhuster/autosave.nvim",
        event = "InsertEnter",
    },

    {
        "brianhuster/live-preview.nvim",
        dependencies = { "brianhuster/autosave.nvim" }, -- Not required, but recomended for autosaving
    },

    "mg979/vim-visual-multi",

    { "rose-pine/neovim", name = "rose-pine" },
    --copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            panel = {
                auto_refresh = true,
                layout = {
                    position = "right",
                    ratio = 0.3,
                },
            },
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = "<C-l>",
                },
            },
        },
    },

    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})
        end,
    },
}
