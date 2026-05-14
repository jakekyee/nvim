local group = vim.api.nvim_create_augroup("pane_highlight", { clear = true })

local function get_hl(name)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if ok then
    return hl
  end

  return {}
end

local function set_pane_highlights()
  local normal = get_hl("Normal")
  local normal_nc = get_hl("NormalNC")
  local cursorline = get_hl("CursorLine")
  local cursorlinenr = get_hl("CursorLineNr")
  local winseparator = get_hl("WinSeparator")

  vim.api.nvim_set_hl(0, "PaneActive", {
    bg = cursorline.bg or normal.bg,
  })

  vim.api.nvim_set_hl(0, "PaneInactive", {
    bg = normal_nc.bg or normal.bg,
  })

  vim.api.nvim_set_hl(0, "PaneActiveEndOfBuffer", {
    fg = cursorline.bg or normal.bg,
    bg = cursorline.bg or normal.bg,
  })

  vim.api.nvim_set_hl(0, "PaneInactiveEndOfBuffer", {
    fg = normal_nc.bg or normal.bg,
    bg = normal_nc.bg or normal.bg,
  })

  vim.api.nvim_set_hl(0, "PaneActiveSeparator", {
    fg = cursorlinenr.fg or winseparator.fg or normal.fg,
    bold = true,
  })

  vim.api.nvim_set_hl(0, "PaneInactiveSeparator", {
    fg = winseparator.fg or normal_nc.fg or normal.fg,
  })
end

local function refresh_panes()
  set_pane_highlights()

  local current_win = vim.api.nvim_get_current_win()

  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local is_current = win == current_win

    vim.wo[win].cursorline = is_current
    vim.wo[win].winhighlight = table.concat({
      "Normal:" .. (is_current and "PaneActive" or "PaneInactive"),
      "NormalNC:PaneInactive",
      "EndOfBuffer:" .. (is_current and "PaneActiveEndOfBuffer" or "PaneInactiveEndOfBuffer"),
      "WinSeparator:" .. (is_current and "PaneActiveSeparator" or "PaneInactiveSeparator"),
    }, ",")
  end
end

vim.api.nvim_create_autocmd({
  "BufEnter",
  "BufWinEnter",
  "ColorScheme",
  "TabEnter",
  "VimEnter",
  "WinEnter",
  "WinLeave",
}, {
  group = group,
  callback = refresh_panes,
})
