-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = { "html", "cssls", "clangd", }
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    })
end

-- configuring single server, example: typescript
lspconfig.ts_ls.setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
    },
})

lspconfig.emmet_ls.setup({
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    flags = nvlsp.lsp_flags,
})

--config for html 
lspconfig.html.setup({
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    flags = nvlsp.lsp_flags,
    --set file types for lsp 
    filetypes = { "html", "htmldjango" , "ejs"   },
})

--config for cpp 
lspconfig.clangd.setup({
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    flags = nvlsp.lsp_flags,
    }
)
