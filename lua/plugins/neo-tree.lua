return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false, -- neo-tree will lazily load itself
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		use_libuv_file_watcher = true,
		filesystem = {
			follow_current_file = { enabled = true },
			hijack_netrw_behavior = "open_current",
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		},
	},
	config = function()
		vim.keymap.set("n", "<C-n>", function()
			local neo_tree = require("neo-tree.command")
			neo_tree.execute({
				toggle = true,
				position = "left",
				reveal = true,
			})
		end, { noremap = true, silent = true })
	end,
}
