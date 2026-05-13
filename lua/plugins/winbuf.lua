require("winbuf").setup({
  style = "thin",           -- "thin", "thick", "slant", "padded_slant", "slope", "round"
  separator_style = nil,    -- override with { left, right } or a preset name
  indicator = {
    style = "bar",          -- "bar", "underline", "none"
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
  diagnostics = false,      -- set to "nvim_lsp" to enable
  buf_delete = nil,         -- custom delete fn, e.g. Snacks.bufdelete
})


vim.keymap.set("n", "<C-l>", function()
  winbuf.move_buf("l")
  winbuf.cycle(1)
end, { desc = "Rotate buffer right (ring)" })

vim.keymap.set("n", "<C-h>", function()
  winbuf.move_buf("h")
  winbuf.cycle(-1)
end, { desc = "Rotate buffer left (ring)" })
