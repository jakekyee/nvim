return {
  "nvim-mini/mini.nvim",
  enabled = function()
    return vim.fn.argc(-1) == 0
  end,
  event = "VimEnter",
  config = function()
    local starter = require("mini.starter")
    local starter_input = require("config.starter")
    local group = vim.api.nvim_create_augroup("starter_dismiss_on_input", { clear = true })

    starter.setup({
      items = {},
      header = "nvim",
      footer = "placeholder",
    })

    starter_input.setup_paste()

    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "MiniStarterOpened",
      callback = function(args)
        starter_input.attach(args.buf)
      end,
    })
  end,
}
