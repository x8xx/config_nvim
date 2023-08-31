vim.g.mapleader = " "

vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Tab>", "gt", {noremap=true})
vim.api.nvim_set_keymap("n", "<S-Tab>", "gT", {noremap=true})

vim.api.nvim_set_keymap("n", "H", "<C-w>h", {noremap=true})
vim.api.nvim_set_keymap("n", "J", "<C-w>j", {noremap=true})
vim.api.nvim_set_keymap("n", "K", "<C-w>k", {noremap=true})
vim.api.nvim_set_keymap("n", "L", "<C-w>l", {noremap=true})
vim.api.nvim_set_keymap("n", "zj", "12j", {noremap=true})
vim.api.nvim_set_keymap("n", "zk", "12k", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-f>", "<Right>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-y>", "y`m", {noremap=true})

vim.api.nvim_set_keymap("n", "x", "\"_x", {noremap=true})
vim.api.nvim_set_keymap("n", "X", "\"_X", {noremap=true})

vim.api.nvim_set_keymap("n", "<leader>1", ":<C-u>b #<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>2", ":<C-u>tabnew<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>3", ":<C-u>noh<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>4", ":<C-u>Neotree<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>4", ":<C-u>Neotree close<CR>", {noremap=true})

--deol
vim.api.nvim_set_keymap("n", "<leader>o", ":<C-u>Deol -split=floating -winheight=60 -winwidth=160<CR>", {noremap=true})
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", {noremap=true})
vim.api.nvim_set_keymap("t", "<C-\\>", "<C-\\><C-n>", {noremap=true})

--neogit
-- vim.api.nvim_set_keymap("n", "<leader>", ":<C-u>Neogit<CR>", {noremap=true})

--yanky
vim.api.nvim_set_keymap("n", "p", "<Plug>(YankyPutAfter)", {noremap=true})
vim.api.nvim_set_keymap("n", "P", "<Plug>(YankyPutBefore)", {noremap=true})
vim.api.nvim_set_keymap("n", "gp", "<Plug>(YankyGPutAfter)", {noremap=true})
vim.api.nvim_set_keymap("n", "gP", "<Plug>(YankyGPutBefore)", {noremap=true})

--telescope
vim.api.nvim_set_keymap("n", "<leader>f", ":<C-u>Telescope find_files<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>g", ":<C-u>Telescope live_grep<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>b", ":<C-u>Telescope buffers<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>fh", ":<C-u>Telescope help_tags<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>n", ":<C-u>Telescope file_browser<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>n", ":<C-u>Neotree<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>y", ":<C-u>Telescope yank_history<CR>", {noremap=true})
