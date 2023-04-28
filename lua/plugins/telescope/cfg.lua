require('telescope').setup {
    defaults = { mappings = require('plugins.telescope.binds') },
    pickers = {
        find_files = {
            -- theme = "ivy",
        },
        git_files = {
            -- theme = "ivy",
        }
    },
}
require("telescope").load_extension("ui-select")
