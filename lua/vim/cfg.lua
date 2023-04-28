local vset = vim.opt
local home = os.getenv("HOME")

vim.g['mapleader'] = ' '
vim.g['localleader'] = '\\'

vset.relativenumber = false
vset.syntax = on

vim.cmd("colorscheme nord")
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

vset.foldexpr = 'nvim_treesitter#foldexpr()'
vset.foldmethod = 'expr'
vset.foldenable = false

vim.opt.colorcolumn = "80"

require('Comment').setup()
