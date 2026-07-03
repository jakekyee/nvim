return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "TermExec", "ToggleTerm" },
  keys = {
    { "<leader>qq", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
    { "<leader>q1", "<cmd>lua _G.toggleterm_toggle_term1()<CR>", desc = "Toggle terminal 1" },
    { "<leader>q2", "<cmd>lua _G.toggleterm_toggle_term2()<CR>", desc = "Toggle terminal 2" },
  },
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = false,
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })

    -- make <Esc> close the floating terminal from terminal mode
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n><cmd>ToggleTerm<CR>]], { silent = true })

    -- create two persistent floating terminals and global toggle functions
    local Terminal = require("toggleterm.terminal").Terminal
    local t1 = Terminal:new({
      direction = "float",
      close_on_exit = true,
      hidden = true,
      on_open = function(term)
        -- buffer-local terminal-mode <Esc> to close this terminal
        vim.keymap.set('t', '<Esc>', function()
          term:toggle()
        end, { buffer = term.bufnr, silent = true })
      end,
    })

    local t2 = Terminal:new({
      direction = "float",
      close_on_exit = true,
      hidden = true,
      on_open = function(term)
        -- buffer-local terminal-mode <Esc> to close this terminal
        vim.keymap.set('t', '<Esc>', function()
          term:toggle()
        end, { buffer = term.bufnr, silent = true })
      end,
    })

    _G.toggleterm_toggle_term1 = function()
      t1:toggle()
    end

    _G.toggleterm_toggle_term2 = function()
      t2:toggle()
    end
  end,
}
