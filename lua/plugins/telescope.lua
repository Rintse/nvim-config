actions = require('telescope.actions')

mappings = {
    i = {
        ["<esc>"] = actions.close,
        ["<C-v>"] = actions.select_vertical,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-d>"] = actions.delete_buffer,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
    },
}

require('telescope').setup {
    defaults = { mappings = mappings },
    pickers = {
        find_files = {
            -- theme = "ivy",
        },
        git_files = {
            -- theme = "ivy",
        },
        lsp_references = {
            -- theme = "dropdown",
            -- layout_config = {
            --     width = 0.75,
            -- }
        }
    },
}

require("telescope").load_extension("ui-select")

-- Calls telescope git_files if in a git repo,
-- calls telescope find_files otherwise
function TS_git_fallback()
    local rv_ok = pcall(require'telescope.builtin'.git_files)
    if not rv_ok then require'telescope.builtin'.find_files() end
end

function ts_symbols(symbol_type)
    return function()
        require'telescope.builtin'.treesitter({ symbols = symbol_type })
    end
end

vim.keymap.set('n', '<Leader>fa', TS_git_fallback)
vim.keymap.set('n', '<Leader>fA', require'telescope.builtin'.find_files)
vim.keymap.set('n', '<Leader>fg', require'telescope.builtin'.live_grep)
vim.keymap.set('n', '<Leader>fb', require'telescope.builtin'.buffers)
vim.keymap.set('n', '<Leader>fo', require'telescope.builtin'.jumplist)
vim.keymap.set('n', '<Leader>ff', require'telescope.builtin'.resume)
vim.keymap.set('n', '<Leader>fm', require'telescope.builtin'.marks)
vim.keymap.set('n', '<Leader>fsf', ts_symbols('function'))
vim.keymap.set('n', '<Leader>fsv', ts_symbols('var'))
vim.keymap.set('n', '<Leader>fsp', ts_symbols('parameter'))

