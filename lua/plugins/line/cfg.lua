local options = { 
    theme = 'nord',
}

require('lualine').setup(options)

-- Make sure line number updates when cursor is moved
-- vim.api.nvim_create_autocmd('CursorMoved', {
--     callback = function()
-- 	require('lualine').refresh()
--     end
-- })
