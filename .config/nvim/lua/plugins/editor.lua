return {

	-- Autopairs + autotag
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
				fast_wrap = {},
			})
		end,
	},

	-- nvim treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
	},

	-- Autotag
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},

	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				window = { width = 30 },
				filesystem = {
					follow_current_file = { enabled = true },
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = false,
					},
				},
			})
		end,
	},

	-- FZF
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find files" },
			{ "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
			{ "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Find buffers" },
			{ "<leader>fh", "<cmd>FzfLua help_tags<CR>", desc = "Help tags" },
		},
	},
}
