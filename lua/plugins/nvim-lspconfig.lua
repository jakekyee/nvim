
return {
  {
    "neovim/nvim-lspconfig",
    version = "1.*",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim", version = "1.*", opts = {} },
      { "williamboman/mason-lspconfig.nvim", version = "1.*" },
    },
    config = function()
      require("mason").setup({
        PATH = "prepend",
      })

      local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
      vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = false,
      })

      require("config.lsp")
    end,
  },
}

