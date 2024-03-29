if true then return {} end
return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all Notifications",
    },
  },
  opts = {
    background_colour = "#000000",
    timeout = 1000,
    max_height = function()
      return math.floor(vim.o.lines * 0.5)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.5)
    end,
  },
  init = function()
    -- when noice is not enabled, install notify on VeryLazy
    vim.notify = require("notify")
  end,
}
