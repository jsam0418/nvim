require("vim-options")
require("config.lazy")
require("config.breadcrumbs")

-- vim.cmd("set number")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "auto:1-2"
vim.o.winbar = "%{%v:lua.require'config.breadcrumbs'.filepath()%}"

