return {
  "nvim-mini/mini.nvim",
  enabled = function()
    return vim.fn.argc(-1) == 0
  end,
  event = "VimEnter",
  config = function()
    require("mini.starter").setup({
      items = {},
      header = "nvim",
      footer = "placeholder",
    })
  end,
}
