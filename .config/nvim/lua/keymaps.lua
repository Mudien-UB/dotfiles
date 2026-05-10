local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear highlight" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Resize up" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Resize down" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize left" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize right" })

-- Escape
map("i", "jk", "<Esc>", { desc = "Escape" })

-- Neo-tree
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Explorer toggle" })
map("n", "<leader>o", "<cmd>Neotree focus<CR>", { desc = "Explorer focus" })

-- Buffers
map("n", "[b", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "]b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
map("n", "<leader>bP", "<cmd>BufferLineTogglePin<CR>", { desc = "Pin buffer" })
map("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Close buffer" })
map("n", "<leader>bd", "<cmd>Bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>bD", "<Cmd>bdelete!<CR>", { desc = "Delete buffer force" })

-- LSP (di-attach saat LSP aktif)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }
		map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
		map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
		map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
		map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Implementation" }))
		map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
		map("n", "<leader>lr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
		map("n", "<leader>la", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
		map("n", "<leader>lf", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, vim.tbl_extend("force", opts, { desc = "Format" }))
		map("n", "<leader>ld", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Diagnostics float" }))
		map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Prev diagnostic" }))
		map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
	end,
})
