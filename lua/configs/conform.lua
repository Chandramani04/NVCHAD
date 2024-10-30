local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettier" },
        html = { "prettier" },
        -- javascript = { "prettier" },
        javascriptreact = { "prettier" },
        javascript = {
            cmd = "prettier",
            args = { "--tab-width", "4" },
            stdin = true,
        },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        cpp = { "clang-format" },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        lsp_fallback = true,
        timeout_ms = 500,
    },
    format = function(bufnr)
        vim.bo[bufnr].tabstop = 4
        vim.bo[bufnr].shiftwidth = 4
        vim.bo[bufnr].expandtab = true -- Converts tabs to spaces
        return {}
    end,
}

return options
