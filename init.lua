vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local bin_path = vim.fn.stdpath("config") .. "/bin"
vim.env.PATH = bin_path .. ":" .. vim.env.PATH


--vim.opt.relativenumber = true
vim.opt.number = true

require("core.options")
require("core.keymaps")
require("core.autocmds")

require("config.lazy")
