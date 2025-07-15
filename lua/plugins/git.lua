return {
  {
    "sindrets/diffview.nvim",
    config = function()
      vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", {})
      vim.keymap.set("n", "<leader>gdc", ":DiffviewClose<CR>", {})
      vim.keymap.set("n", "<leader>gdh", ":DiffviewFileHistory<CR>", {})
      vim.keymap.set("n", "<leader>gdf", ":DiffviewFileHistory %<CR>", {})
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      vim.keymap.set("n", "<leader>go", ":Neogit kind=vsplit<CR>", {})
    end,
  },
}
