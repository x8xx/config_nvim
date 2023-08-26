local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<TAB>"] = actions.select_tab
            }
        }
    },
    extensions = {
        file_browser = {
            depth = 1,
        }
    }
})
