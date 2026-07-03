vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local bin_path = vim.fn.stdpath("config") .. "/bin"
vim.env.PATH = bin_path .. ":" .. vim.env.PATH


--vim.opt.relativenumber = true
vim.opt.number = true

vim.filetype.add({
  extension = {
    dml = "c",
  },
})


vim.opt.laststatus = 2
vim.opt.statusline = "%f %m%r%h%w [%l,%c] [%p%%]"
vim.opt.winbar = "%f"
vim.opt.title = true
vim.opt.titlestring = "%f"

require("core.options")
require("core.keymaps")
require("core.autocmds")

require("config.lazy")
