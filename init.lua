vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

--autosave setup
-- require('autosave').setup({
-- })

--live-preview setup
require("live-preview").setup({
    commands = {
        start = "LivePreview", -- Command to start the live preview server and open the default browser. Default is 'LivePreview'
        stop = "StopPreview", -- Command to stop the live preview. Default is 'StopPreview'
    },
    port = 5500, -- Port to run the live preview server on. Default is 5500
    browser = "default", -- Browser to open the live preview in. Default is 'default', meaning the default browser of your system will be used
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("nvchad.autocmds")

vim.schedule(function()
    require("mappings")
end)

--vscode format i.e json files
-- /home/cmd/.config/nvim/snippets/vscode
vim.g.vscode_snippets_path = "/home/cmd/.config/nvim/snippets/vscode"

--emmet-ls setup
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not configs.ls_emmet then
    configs.ls_emmet = {
        default_config = {
            cmd = { "ls_emmet", "--stdio" },
            filetypes = {
                "html",
                "css",
                "scss",
                "javascriptreact",
                "typescriptreact",
                "haml",
                "xml",
                "xsl",
                "pug",
                "slim",
                "sass",
                "stylus",
                "less",
                "sss",
                "hbs",
                "handlebars",
            },
            root_dir = function(fname)
                return vim.loop.cwd()
            end,
            settings = {},
        },
    }
end

lspconfig.ls_emmet.setup({ capabilities = capabilities })

--onedarkpro setup
require("onedarkpro").setup({
    highlights = {
        Comment = { italic = true },
        Directory = { bold = true },
        ErrorMsg = { italic = true, bold = true },
    },
})

-- copilot.lua setup
require("copilot").setup({
    suggestion = {
        enabled = false,
        auto_trigger = true,
        debounce = 75,
    }, -- Disable default Copilot suggestions
    panel = { enabled = false }, -- Disable Copilot panel if not needed
})

-- copilot-cmp setup
require("copilot_cmp").setup()

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
    sources = {
        { name = "copilot", group_index = 2 },
        { name = "nvim_lsp", group_index = 2 },
        -- Add more sources here as needed
    },
})



 require('multicursors').setup {
    -- local N = require("multicursors.normal_mode"),
        --fix this , it's saying undefined global N 
    normal_keys = {
        -- to change default lhs of key mapping change the key
        [','] = {
            -- assigning nil to method exits from multi cursor mode
            -- assigning false to method removes the binding
            method = require("multicursors.normal_mode").clear_others,
            -- you can pass :map-arguments here
            opts = { desc = 'Clear others' },
        },
        ['<C-/>'] = {
            method = function()
                require('multicursors.utils').call_on_selections(function(selection)
                    vim.api.nvim_win_set_cursor(0, { selection.row + 1, selection.col + 1 })
                    local line_count = selection.end_row - selection.row + 1
                    vim.cmd('normal ' .. line_count .. 'gcc')
                end)
            end,
            opts = { desc = 'comment selections' },
        },
    },
}

--checking git status


-- require("supermaven-nvim").setup({
--   keymaps = {
--     -- accept_suggestion = "<Tab>",
--     accept_suggestion = "<C-y>",
--     clear_suggestion = "<C-]>",
--     accept_word = "<C-j>",
--   },
--   -- ignore_filetypes = { cpp = true }, -- or { "cpp", }
--   color = {
--     suggestion_color = "#ffffff",
--     cterm = 244,
--   },
--   log_level = "info", -- set to "off" to disable logging completely
--   disable_inline_completion = false, -- disables inline completion for use with cmp
--   disable_keymaps = false, -- disables built in keymaps for more manual control
--   condition = function()
--     return false
--   end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
-- })
