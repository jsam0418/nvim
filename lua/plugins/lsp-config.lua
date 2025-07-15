return {
  {
    "mason-org/mason.nvim",
    opts = {},
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {
        settings = {
          ["lua_ls"] = {},
        },
      })
      vim.lsp.config("clangd", {
        settings = {
          ["clangd"] = {
            cmd = {
              "clangd",
              "--background-index",
              "--clang-tidy",
              "--completion-style=detailed",
              "--experimental-modules-support",
              "--query-driver=/usr/bin/clang++,/usr/bin/g++",
            },
          },
        },
      })
      vim.lsp.enable("clangd")
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, {})
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, {})
      vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, {})
      vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_workspace_symbols, {})

      vim.diagnostic.config({
        -- ‑‑ INLINE MESSAGES ‑‑
        virtual_text = {
          -- show the full message; shorten/format if you like
          format = function(d)
            return d.message
          end,
          -- add a small icon or single letter in front of each line
          prefix = "●", -- or '㧬', '▶', etc.
          spacing = 4, -- gap between code and message
        },

        -- keep the signs you already have
        signs = true,

        -- optional visual bells
        underline = true,     -- underline the offending range
        severity_sort = true, -- most severe first
        update_in_insert = false, -- wait until you leave insert mode
      })

      -- Pop‑up the full diagnostic under the cursor after a short pause
      vim.o.updatetime = 250
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
        end,
      })
    end,
  },
}
