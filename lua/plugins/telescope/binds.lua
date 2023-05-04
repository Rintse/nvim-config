-- Calls telescope git_files if in a git repo,
-- calls telescope find_files otherwise
function TS_git_fallback()
    local rv_ok = pcall(require'telescope.builtin'.git_files)
    if not rv_ok then require'telescope.builtin'.find_files() end
end

vim.keymap.set('n', '<Leader>fa', TS_git_fallback)
vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<Leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>ff', require'telescope.builtin'.resume)

actions = require('telescope.actions')

return {
    i = {
        ["<esc>"] = actions.close,
        ["<C-v>"] = actions.select_vertical,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-d>"] = actions.delete_buffer,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
    },
}
