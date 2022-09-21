local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "clangd", "tailwindcss", "emmet_ls", "pyright", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,capabilities
  }
end

lspconfig.emmet_ls.setup {
  filetypes = { "html", "typescript", "javascript", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
}
