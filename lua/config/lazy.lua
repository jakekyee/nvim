local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

local function get_missing_plugins()
  if not (vim.uv or vim.loop).fs_stat(lockfile) then
    return {}
  end

  local ok, locked = pcall(vim.json.decode, table.concat(vim.fn.readfile(lockfile), "\n"))
  if not ok or type(locked) ~= "table" then
    return {}
  end

  local missing = {}
  local data_path = vim.fn.stdpath("data") .. "/lazy/"

  for name, _ in pairs(locked) do
    if not (vim.uv or vim.loop).fs_stat(data_path .. name) then
      table.insert(missing, name)
    end
  end

  table.sort(missing)
  return missing
end

local missing_plugins = get_missing_plugins()
local should_install_missing = false

if #missing_plugins > 0 then
  if #vim.api.nvim_list_uis() == 0 then
    should_install_missing = true
  else
    local preview = table.concat(vim.list_slice(missing_plugins, 1, 5), ", ")
    if #missing_plugins > 5 then
      preview = preview .. ", ..."
    end

    local choice = vim.fn.confirm(
      string.format("Missing %d plugin(s): %s\nInstall them now?", #missing_plugins, preview),
      "&Install\n&Quit",
      1
    )

    if choice ~= 1 then
      vim.schedule(function()
        vim.notify("Plugins are missing. Restart and choose Install to restore them.", vim.log.levels.WARN)
        vim.cmd("qa")
      end)
      return
    end

    should_install_missing = true
  end
end

require("lazy").setup(require("plugins"), {
  local_spec = false,
  lockfile = lockfile,
  install = {
    missing = should_install_missing,
    colorscheme = {},
  },
  pkg = {
    enabled = false,
  },
  rocks = {
    enabled = false,
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "rplugin",
        "spellfile",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
