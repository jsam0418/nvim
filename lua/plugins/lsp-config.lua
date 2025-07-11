return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls","clangd"}
      })
    end
  }--,
--  {
--      "neovim/nvim-lspconfig",
--      config = function()
--        local lspconfig = require('lspconfig')
--        lspconfig.lua_ls.setup({})
--      end
--  }
}
