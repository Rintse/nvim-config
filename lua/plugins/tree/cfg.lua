local binds = {
    { key = "u", action = "dir_up" },
    { key = "<C-d>", action = "cd" },
    { key = "<C-s>", action = "split" },
}

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'cd',    api.tree.change_root_to_node,   opts('CD'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical,         opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-s>', api.node.open.horizontal,       opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'u',     api.tree.change_root_to_parent, opts('Up'))
end

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    on_attach = on_attach,
})
