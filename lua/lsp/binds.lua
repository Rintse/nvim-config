local tele = require('telescope.builtin')
local preview = require('goto-preview')
local dap = require('dap')

function vsplit_lsp(action)
    action()
    vim.cmd("vs#")
end 

local M = {
    binds = {
        { key = '<Leader>gpd'   ,   action = preview.goto_preview_definition },
        { key = '<Leader>gpi'   ,   action = preview.goto_preview_implementation },
        { key = '<Leader>gP'    ,   action = preview.close_all_win },
        { key = '<Leader>gpr'   ,   action = preview.goto_preview_references },
        
        { key = '<Leader>vgd'   ,   action = function() vsplit_lsp(vim.lsp.buf.definition) end },
        { key = '<Leader>vgi'   ,   action = function() vsplit_lsp(vim.lsp.buf.implementation) end },
        { key = '<Leader>vgt'   ,   action = function() vsplit_lsp(vim.lsp.buf.type_definition) end },

        { key = '<Leader>gD'    ,   action = vim.lsp.buf.declaration },
        { key = '<Leader>gd'    ,   action = vim.lsp.buf.definition },
        { key = '<Leader>i'     ,   action = vim.lsp.buf.hover },
        { key = '<Leader>gi'    ,   action = vim.lsp.buf.implementation },
        { key = '<Leader>gt'    ,   action = vim.lsp.buf.type_definition },
        { key = '<Leader>rn'    ,   action = vim.lsp.buf.rename },
        { key = '<Leader>a'     ,   action = vim.lsp.buf.code_action },
        { key = '<Leader>d'     ,   action = vim.diagnostic.open_float },
        { key = '<Leader>gr'    ,   action = tele.lsp_references },
        { key = '<Leader>gci'   ,   action = tele.lsp_incoming_calls },
        { key = '<Leader>gco'   ,   action = tele.lsp_outgoing_calls },
        { key = '<Leader>q'     ,   action = vim.diagnostic.setloclist },

        { key = '<Leader>el'    ,   action = function() tele.diagnostics({bufnr=0}) end },
        { key = '<Leader>ep'    ,   action = vim.diagnostic.goto_prev },
        { key = '<Leader>en'    ,   action = vim.diagnostic.goto_next },
    },
}

local opts = { noremap=true, silent=true, buffer=bufnr }

-- DAP
vim.keymap.set('n', '<Leader>db',   dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>dc',   dap.continue)
vim.keymap.set('n', '<Leader>dso',  dap.step_over)
vim.keymap.set('n', '<Leader>dsi',  dap.step_into)
vim.keymap.set('n', '<Leader>do',   dap.repl.open)

function M.set_lsp_binds(self, bufnr)

    for i,mapping in ipairs(M.binds) do
        vim.keymap.set('n', mapping.key, mapping.action, opts)
    end
end

return M
