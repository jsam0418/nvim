require("vim-options")
require("config.lazy")

vim.cmd("set number")

-- lua/init.lua  or  after/plugins/diagnostic.lua
--vim.diagnostic.config({
--  -- ‑‑ INLINE MESSAGES ‑‑
--  virtual_text = {
--    -- show the full message; shorten/format if you like
--    format  = function(d) return d.message end,
--    -- add a small icon or single letter in front of each line
--    prefix  = '●',          -- or '㧬', '▶', etc.
--    spacing = 4,            -- gap between code and message
--  },
--
--  -- keep the signs you already have
--  signs = true,
--
--  -- optional visual bells
--  underline        = true,      -- underline the offending range
--  severity_sort    = true,      -- most severe first
--  update_in_insert = false,     -- wait until you leave insert mode
--})
--
---- Pop‑up the full diagnostic under the cursor after a short pause
--vim.o.updatetime = 250
--vim.api.nvim_create_autocmd("CursorHold", {
--  callback = function()
--    vim.diagnostic.open_float(nil, {focus = false, border = "rounded"})
--  end,
--})

