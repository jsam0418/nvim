return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		-- Will use Telescope if installed or a vim.ui.select picker otherwise
		{ "<leader>wr", "<cmd>SessionSearch<CR>", desc = "Session search" },
		{ "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session" },
		{ "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
	},

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	picker_opts = {
		opts = {
			load_on_setup = true,
		},
	},
	config = function()
		require("auto-session").setup({
			bypass_save_filetypes = { "alpha", "dashboard" }, -- or whatever dashboard you use
		})
	end,
}
