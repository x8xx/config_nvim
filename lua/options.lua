local options = {
    number = true,
    syntax = "enable",
    expandtab = true,
    smartindent = true,
    shiftwidth = 4,
    shiftwidth = 4,
    encoding = "utf-8",
    hlsearch = true,
    backup = false,
    completeopt = "menuone,noinsert",
    background = "light",
    mouse = ""
}

for k, v in pairs(options) do
     vim.opt[k] = v
end
