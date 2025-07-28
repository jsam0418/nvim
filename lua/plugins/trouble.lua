return {
  "folke/trouble.nvim",
  branch = "main",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  lazy = false,
  opts = {
    focus = true,
  }, -- for default options, refer to the configuration section for custom setup.
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
  config = function()
    local trouble = require("trouble")
    trouble.setup()

    local actions = require("telescope.actions")

    local telescope_trouble = require("trouble.sources.telescope")

    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-t>"] = function(...)
              telescope_trouble.open(...)
              -- Defer focus to bottom Trouble window
              vim.defer_fn(function()
                -- Try switching to bottom window (Trouble layout)
                vim.cmd("wincmd j")
              end, 50)
            end,
          },
          n = {
            ["<C-t>"] = function(...)
              telescope_trouble.open(...)
              vim.defer_fn(function()
                vim.cmd("wincmd j")
              end, 50)
            end,
          },
        },
      },
    })
  end,
}
