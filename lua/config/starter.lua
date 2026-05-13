local M = {}

local original_paste = vim.paste
local paste_wrapped = false

local function is_starter_buffer(buf)
  buf = buf or vim.api.nvim_get_current_buf()

  return vim.api.nvim_buf_is_valid(buf)
    and vim.bo[buf].filetype == "ministarter"
    and vim.b[buf].starter_passthrough == true
end

local function open_edit_buffer()
  if not is_starter_buffer() then
    return false
  end

  vim.cmd("enew")
  vim.cmd("startinsert")

  return true
end

local function handoff_key(key)
  vim.schedule(function()
    if not open_edit_buffer() then
      return
    end

    vim.api.nvim_feedkeys(vim.keycode(key), "in", false)
  end)
end

local function handoff_paste(text)
  vim.schedule(function()
    if not open_edit_buffer() then
      return
    end

    vim.api.nvim_paste(text, false, -1)
  end)
end

function M.setup_paste()
  if paste_wrapped then
    return
  end

  paste_wrapped = true

  vim.paste = function(lines, phase)
    if is_starter_buffer() then
      if not open_edit_buffer() then
        return false
      end
    end

    return original_paste(lines, phase)
  end
end

function M.attach(buf)
  vim.b[buf].starter_passthrough = true

  for code = 48, 57 do
    local key = string.char(code)

    vim.keymap.set("n", key, function()
      handoff_key(key)
    end, {
      buffer = buf,
      nowait = true,
      silent = true,
    })
  end

  for code = 65, 90 do
    local key = string.char(code)

    vim.keymap.set("n", key, function()
      handoff_key(key)
    end, {
      buffer = buf,
      nowait = true,
      silent = true,
    })
  end

  for code = 97, 122 do
    local key = string.char(code)

    vim.keymap.set("n", key, function()
      handoff_key(key)
    end, {
      buffer = buf,
      nowait = true,
      silent = true,
    })
  end

  vim.keymap.set("n", "<C-v>", function()
    handoff_paste(vim.fn.getreg("+"))
  end, {
    buffer = buf,
    nowait = true,
    silent = true,
  })
end

return M
