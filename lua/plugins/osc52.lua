return {
  "ojroques/nvim-osc52",
  lazy = false,
  priority = 900,
  config = function()
    local osc52 = require("osc52")

    osc52.setup({ max_length = 0 }) -- 0 = no limit

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
        vim.fn.setreg("+", payload, event.regtype or "v")
        vim.fn.setreg("*", payload, event.regtype or "v")
        osc52.copy(payload)
      end,
    })
  end,
}
