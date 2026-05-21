return {
	-- Which Key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")

			wk.setup({
				delay = 300,
			})

			wk.add({
				{ "<leader>f", group = "Find" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>b", group = "Buffer" },
			})
		end,
	},

	-- Buffer Delete
	{
		"famiu/bufdelete.nvim",
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"famiu/bufdelete.nvim",
		},
		opts = {
			options = {
				mode = "buffers",

				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,

				separator_style = "slant",

				show_buffer_close_icons = true,
				show_close_icon = false,

				close_command = "Bdelete! %d",
				right_mouse_command = "Bdelete! %d",

				offsets = {
					{
						filetype = "NvimTree",
						text = function()
							return vim.fn.getcwd()
						end,
						text_align = "left",
						separator = true,
					},
				},

				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
		},
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				theme = "tomorrow_night",
				globalstatus = true,

				component_separators = "",
				section_separators = "",
			},
		},
	},

	-- Kanagawa Theme
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,

		config = function()
			require("kanagawa").setup({
				compile = true,

				background = {
					dark = "dragon",
					light = "lotus",
				},

				transparent = false,
				terminalColors = true,
				dimInactive = false,

				styles = {
					keywords = { italic = true },
					comments = { italic = true },
					statements = { bold = true },
				},

				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})

			vim.cmd("colorscheme kanagawa")
		end,
	},

	-- Indent Line
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = {
					char = ".",
				},

				scope = {
					enabled = true,
					char = "│",
				},
			})
		end,
	},

	-- Rainbow Delimiters
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			require("rainbow-delimiters.setup").setup()
		end,
	},
}
