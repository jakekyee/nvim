return {
  "walkersumida/fusen.nvim",
  opts = {
    save_file = vim.fn.stdpath("data") .. "/fusen_marks.json",
    mark = {
      icon = "󰍕",
      hl_group = "Special",
    },
    annotation_display = {
      mode = "eol",
      float = {
        delay = 100,
        border = "rounded",
        max_width = 60,
        max_height = 15,
      },
    },
    keymaps = {},
  },
  config = function(_, opts)
    require("fusen").setup(opts)
  end,
  keys = {
    {
      "<leader>ee",
      function()
        require("fusen").add_mark()
      end,
      desc = "Add/Edit mark",
    },
    {
      "<leader>ef",
      function()
        require("fusen").clear_mark()
      end,
      desc = "Delete mark",
    },
    {
      "<leader>ew",
      function()
        require("fusen").toggle_mark()
      end,
      desc = "Toggle mark",
    },
    {
      "<leader>et",
      function()
        require("fusen").next_mark()
      end,
      desc = "Next mark",
    },
    {
      "<leader>eq",
      function()
        require("fusen").prev_mark()
      end,
      desc = "Previous mark",
    },
    {
      "<leader>es",
      function()
        require("fusen").list_marks()
      end,
      desc = "List marks",
    },
  },
}
