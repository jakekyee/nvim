vim.g.mapleader = " "
vim.g.maplocalleader = " "

local bin_path = vim.fn.stdpath("config") .. "/bin"
vim.env.PATH = bin_path .. ":" .. vim.env.PATH
require("core.options")
require("core.keymaps")
require("core.autocmds")

require("plugins")
