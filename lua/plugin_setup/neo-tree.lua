require("neo-tree").setup({
    default_component_configs = {
        window = {
            mappings = {
                ["o"] = "open"
            }
        },
        filesystem = {
            window = {
                mappings = {
                    ["Oc"] = { "order_by_created", nowait = false },
                    ["Od"] = { "order_by_diagnostics", nowait = false },
                    ["Og"] = { "order_by_git_status", nowait = false },
                    ["Om"] = { "order_by_modified", nowait = false },
                    ["On"] = { "order_by_name", nowait = false },
                    ["Os"] = { "order_by_size", nowait = false },
                    ["Ot"] = { "order_by_type", nowait = false },
                }
            }
        }
    },
})
