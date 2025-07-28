return {
	"VonHeikemen/fine-cmdline.nvim",
  config = function()
    require("fine-cmdline").setup({
    })
    vim.api.nvim_set_keymap("n", ":", "<Cmd>FineCmdline<CR>", { noremap = true, silent = true })
  end,
}
