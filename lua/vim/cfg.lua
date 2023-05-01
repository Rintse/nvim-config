local vset = vim.opt
local home = os.getenv("HOME")

vim.g['mapleader'] = ' '
vim.g['localleader'] = '\\'

vset.relativenumber = false
vset.syntax = on

vim.cmd("colorscheme onenord")
vim.api.nvim_set_hl(0, 'vertsplit', { fg = "LightSteelBlue4" })

vset.laststatus = 2 --Always keep statusbar
vset.belloff='all'

-- Better tab completion for filenames
vset.wildmode=longest,list
vset.wildmenu = true

vset.hls = false
vset.ignorecase = true
vset.smartcase = true

-- Relative linenumbers except current line 
vset.number = true
vset.relativenumber = true

-- More intuitve split locations
vset.splitbelow = true
vset.splitright = true

-- Hidden buffers for easy switching
vset.hidden = true

-- Set tab=4 spaces
vset.expandtab = true
vset.tabstop = 4
vset.softtabstop = 4
vset.shiftwidth = 4

-- Keep undo history
vset.undofile = true
vset.undodir = home .. '/.config/undodir'

-- Prevent swp files from accidentally getting gitted
vset.directory = home .. '/.config/swapfiles/'

vset.spelllang = 'en_gb'
vset.joinspaces = false

vset.foldmethod = 'expr'
vset.foldexpr = 'nvim_treesitter#foldexpr()'

vset.foldenable = false
vim.opt.colorcolumn = "81"
vim.cmd("hi vertsplit guifg=#616e88 guibg=bg")

local setup_glft = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.cmd("set ft=json")
end

vim.api.nvim_create_augroup("gltf", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufNew"}, {
    group = "gltf",
    pattern = { "*.gltf" },
    callback = setup_glft
})

require('Comment').setup()
