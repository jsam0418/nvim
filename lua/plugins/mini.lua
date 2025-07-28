return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.ai").setup()
    require("mini.move").setup()
    require("mini.pairs").setup()
    require("mini.splitjoin").setup()
    require("mini.surround").setup()
    require("mini.files").setup()
    vim.keymap.set("n", "<leader>mf", function()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
      MiniFiles.open(path)
      MiniFiles.reveal_cwd()
    end, { desc = "Open Mini Files" })
  end,
}
