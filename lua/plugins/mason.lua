return {
  "williamboman/mason.nvim",
  version = "1.*",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonLog",
    "MasonUninstall",
    "MasonUpdate",
  },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {},
}
