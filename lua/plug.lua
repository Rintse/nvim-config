-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Helper function since TSUpdate doesn't work
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
updateTS = function() 
    require('nvim-treesitter.install').update(
        { with_sync = true }
    )
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'eandrju/cellular-automaton.nvim'

    -- Allow other processes to interact (like back-srch in pdf)
    use 'mhinz/neovim-remote'
    -- Surround objects
    use 'tpope/vim-surround'
    -- Dot repeat custom stuff
    use 'tpope/vim-repeat'

    -- Language aware commenting
    use 'numToStr/Comment.nvim'
    
    -- Looks
    use 'nvim-lualine/lualine.nvim'
    use 'shaunsingh/nord.nvim'
    -- use 'andersevenrud/nordic.nvim'
    use 'kyazdani42/nvim-web-devicons'
    
    -- File/buffer/window management
    use 'nvim-telescope/telescope.nvim'
    use 'sindrets/winshift.nvim'
    use 'kyazdani42/nvim-tree.lua'
    
    -- Autocomplete (cmp)
    use 'nvim-telescope/telescope-ui-select.nvim'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    
    -- LSP stuff
    use 'rmagatti/goto-preview'
    use 'neovim/nvim-lspconfig'
    -- LSP Dependencies
    use 'nvim-lua/plenary.nvim'
    use {'nvim-treesitter/nvim-treesitter', 
        run=updateTS
    }
    
    -- Pandoc/LaTeX
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'
end)

