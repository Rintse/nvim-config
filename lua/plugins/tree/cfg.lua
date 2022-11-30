local binds = {
    { key = "u", action = "dir_up" },
    { key = "<C-d>", action = "cd" },
    { key = "<C-s>", action = "split" },
}

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        mappings = { list = binds, },
    },
})
