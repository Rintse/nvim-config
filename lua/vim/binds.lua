vim.keymap.set('n', '<Space>', '<Nop>', {desc='Unbind leader'})

vim.keymap.set('n', 'Z', '<Nop>', {desc='Avoid accidental close'})
vim.keymap.set('n', 'ZZ', '<Nop>', {desc='Avoid accidental close'})

-- Place cursor in between these characters when typed
vim.keymap.set('i', '\"\"', '\"\"<Left>')
vim.keymap.set('i', '\'\'', '\'\'<Left>')
vim.keymap.set('i', '()', '()<Left>')
vim.keymap.set('i', '{}', '{}<Left>')
vim.keymap.set('i', '[]', '[]<Left>')

-- I hate f1
vim.keymap.set('n', '<F1>', '<Nop>')
vim.keymap.set('i', '<F1>', '<Nop>')

-- Line objects
vim.keymap.set('x', 'il', 'g_o^', {desc='Inner line object'})
vim.keymap.set('o', 'il', ':normal vil<CR>')
vim.keymap.set('x', 'al', '$o^', {desc='Outer line object'})
vim.keymap.set('o', 'al', ':normal val<CR>')

-- (un)indent [selection]
vim.keymap.set('n', '<Tab>', '>')
vim.keymap.set('v', '<Tab>', '>gv')
vim.keymap.set('n', '<S-Tab>', '<')
vim.keymap.set('v', '<S-Tab>', '<gv')

-- Delete into the black hole register
vim.keymap.set('n', '<Del>' , '\"_x')

-- search for the current word/selection, while keeping cursor
vim.keymap.set({'n','v'}, '<Leader>d', '*N')
vim.keymap.set('n', '<C-P>', '<C-I>')

-- Window management
vim.keymap.set('n', '<Leader>mm', '<Cmd>WinShift<CR>',          {silent=true})
vim.keymap.set('n', '<Leader>mx',  '<Cmd>WinShift swap<CR>',    {silent=true})
vim.keymap.set('n', '<Leader>mh', '<Cmd>WinShift left<CR>',     {silent=true})
vim.keymap.set('n', '<Leader>mj', '<Cmd>WinShift down<CR>',     {silent=true})
vim.keymap.set('n', '<Leader>mk', '<Cmd>WinShift up<CR>',       {silent=true})
vim.keymap.set('n', '<Leader>ml', '<Cmd>WinShift right<CR>',    {silent=true})

vim.keymap.set('n', '<Leader>fml', ':CellularAutomaton make_it_rain<CR>', {silent = true})
