return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    local wk = require("which-key")

    wk.add({
      {
        "<leader>rr",
        function()
          local word = vim.fn.expand("<cword>")
          local replacement = vim.fn.input('Replace "' .. word .. '" with: ')
          if replacement == "" then
            return
          end
          vim.cmd("%s/\\<" .. word .. "\\>/" .. replacement .. "/g")
        end,
        desc = "Replace word under cursor",
        mode = "n",
      },
    })
  end,
}
