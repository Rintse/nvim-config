local nvim_lsp = require('lspconfig')

-- vim.lsp.set_log_level("debug")

-- Borders around LSP hovers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = "single" }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { border = "single" }
)

local servers = { 
    'hls', 
    'clangd', 
    'eslint', 
    'tsserver',
    'pyright',
    'solargraph',
    'bashls',
}

local on_attach = function(client, bufnr)
    require('lsp.binds').set_lsp_binds(bufnr)
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp')
    .default_capabilities(vim.lsp.protocol.make_client_capabilities())


-- Separate due to settings table
require'lspconfig'.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    settings = { ['rust-analyzer'] = { checkOnSave = {command = "clippy"} } }
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end

require('goto-preview').setup({ height = 25 })
require('nvim-treesitter.configs').setup({ 
    highlight = { enable = true } 
})

-- Fold workaround: 
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
vim.api.nvim_create_autocmd(
    { 'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter' }, 
    { 
        group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
        callback = function()
            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
        end
    }
)
