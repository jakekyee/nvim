return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- enable truecolor when the terminal advertises it
    if vim.env and vim.env.COLORTERM and (string.find(vim.env.COLORTERM, "true") or string.find(vim.env.COLORTERM, "24bit")) then
      vim.o.termguicolors = true
    end

    -- basic theme setup and apply
    local ok, tokyonight = pcall(require, "tokyonight")
    if ok and tokyonight.setup then
      tokyonight.setup({
        style = "night",
        transparent = false,
        terminal_colors = true,
      })
    end

    pcall(vim.cmd, "colorscheme tokyonight")
  end,
}
