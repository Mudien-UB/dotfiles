return {
	-- Mason: LSP installer
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- web
					"ts_ls",
					"html",
					"cssls",
					"emmet_ls",
					"jsonls",
					"eslint",
					-- systems
					"lua_ls",
					"clangd",
					"rust_analyzer",
					-- scripting
					"pyright",
					"bashls",
					-- config
					"yamlls",
					"taplo", -- TOML
					"dockerls",
				},
			})
		end,
	},

	-- LSP config
	{
		"neovim/nvim-lspconfig",
		config = function()
			local servers = {
				"ts_ls",
				"html",
				"cssls",
				"emmet_ls",
				"jsonls",
				"eslint",
				"lua_ls",
				"clangd",
				"rust_analyzer",
				"pyright",
				"bashls",
				"yamlls",
				"taplo",
				"dockerls",
			}
			for _, server in ipairs(servers) do
				vim.lsp.config(server, {})
				vim.lsp.enable(server)
			end
		end,
	},

	-- Autocomplete
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					-- web
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					-- systems
					lua = { "stylua" },
					c = { "clang_format" },
					cpp = { "clang_format" },
					rust = { "rustfmt" },
					-- scripting
					python = { "black" },
					sh = { "shfmt" },
					bash = { "shfmt" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
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
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false, -- khusus Windows (file ber-atribut hidden)
					filtered_items = {
						visible = true, -- tetap tampilkan item yang difilter (dengan warna beda)
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_hidden = false,
					},
				},
			})
		end,
	},

	-- FZF
	{ "junegunn/fzf", build = false },
	{ "junegunn/fzf.vim" },

	-- Which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup()
			wk.add({
				{ "<leader>f", group = "Find (FZF)" },
				{ "<leader>l", group = "LSP" },
			})
		end,
	},
}
