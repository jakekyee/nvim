return {
  "e-sigs/winbuf.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local winbuf = require("winbuf")

    winbuf.setup({
      style = "thin",
      separator_style = nil,
      indicator = {
        style = "bar",
      },
      icons = { enabled = true },
      close_icon = "󰅖",
      modified_icon = "●",
      no_name = "[No Name]",
      hide_single = false,
      show_close_icon = true,
      padding = 1,
      max_name_length = 18,
      truncate_names = true,
      show_buffer_ordinal = false,
      diagnostics = false,
      buf_delete = nil,
    })

    vim.keymap.set("n", "<C-l>", function()
      winbuf.move_buf("l")
      winbuf.cycle(1)
    end, { desc = "Rotate buffer right (ring)" })

    vim.keymap.set("n", "<C-h>", function()
      winbuf.move_buf("h")
      winbuf.cycle(-1)
    end, { desc = "Rotate buffer left (ring)" })
  end,
}
