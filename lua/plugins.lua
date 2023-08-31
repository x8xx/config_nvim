--lazy.nvim install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--lazy.nvim setup
require("lazy").setup({
    -- color scheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        -- config = function()
        --     require("color")
        -- end
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "folke/tokyonight.nvim" },
        config = function()
            local o = vim.opt
            o.laststatus = 3
            require("lualine").setup({
                options = {
                    globalstatus = true,
                    icons_enabled = true,
                    theme = "tokyonight"
                },
                sections = {
                    tabline = {
                      lualine_a = {'buffers'},
                      lualine_b = {'branch'},
                      lualine_c = {'filename'},
                      lualine_x = {},
                      lualine_y = {},
                      lualine_z = {'tabs'}
                    }
                }
            })
        end
    },

    -- show key binds
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },

    -- window resize
    "simeji/winresizer",
    -- commentout
    "/tpope/vim-commentary",
    -- terminal
    "Shougo/deol.nvim",
    -- bracket completion
    "cohama/lexima.vim",
    -- replace surround symbol
    "tpope/vim-surround",
    -- UI for messages, cmdline and popupmenu
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {
        -- add any options here
      },
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
        }
    },

    -- yank history
    {
        "gbprod/yanky.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("plugin_setup/yanky")
            require("telescope").load_extension("yank_history")
        end

    },

    -- git client
    {
        "NeogitOrg/neogit",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require('neogit').setup()
        end
    }, 

    -- fzf
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugin_setup/telescope")
        end
    },

    -- file browser
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").load_extension("file_browser")
        end
    },

    -- file tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        },
        config = function()
            require("plugin_setup/neo-tree")
        end
    },

    -- lsp-client-config
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
              group = vim.api.nvim_create_augroup('UserLspConfig', {}),
              callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>6', function()
                  vim.lsp.buf.format { async = true }
                end, opts)
              end,
            })
        end
    },
    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-emoji",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup {
                sources = cmp.config.sources({
                    {
                        name = "nvim_lsp"
                    },
                    {
                        name = "nvim_lua"
                    },
                    {
                        name = "path"
                    },
                    {
                        name = "buffer"
                    },
                    {
                        name = "emoji"
                    },
                }),
            }
        end
    },
    --"hrsh7th/cmp-nvim-lsp",
    --
    -- lsp-server-installer
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup_handlers {
                function (server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    }
                end,
            }
        end
    },
})
