return {
  "ojroques/nvim-osc52",
  lazy = false,
  priority = 900,
  config = function()
    local ok, osc52 = pcall(require, "osc52")
    if not ok or not osc52 then
      return
    end

    if type(osc52.setup) == "function" then
      pcall(osc52.setup, { max_length = 0 }) -- 0 = no limit
    end

    local group = vim.api.nvim_create_augroup("osc52_autocopy", { clear = true })
    vim.api.nvim_create_autocmd("TextYankPost", {
      group = group,
      callback = function()
        local event = vim.v.event
        local text = event and event.regcontents or nil
        if type(text) ~= "table" or #text == 0 then
          return
        end

        local payload = table.concat(text, "\n")
        pcall(vim.fn.setreg, "+", payload, event.regtype or "v")
        pcall(vim.fn.setreg, "*", payload, event.regtype or "v")
        pcall(function()
          if osc52.copy then
            osc52.copy(payload)
          elseif osc52.copy_register then
            osc52.copy_register("+")
          end
        end)
      end,
    })
  end,
}
