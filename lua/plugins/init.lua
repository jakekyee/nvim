return {
  require("plugins.colorscheme"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.mason"),
  require("plugins.toggleterm"),
  require("plugins.neo-tree"),
  require("plugins.peek"),
  require("plugins.sshfs"),
  require("plugins.fusen"),
  require("plugins.mini"),
  require("plugins.winbuf"),
  {
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}
