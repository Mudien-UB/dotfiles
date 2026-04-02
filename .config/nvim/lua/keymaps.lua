local map = vim.keymap.set
vim.g.mapleader = " "

-- save / quit / misc
map("n", "<leader>w", ":w<CR>",          { desc = "Save" })
map("n", "<leader>q", ":q<CR>",          { desc = "Quit" })
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlight" })

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- resize window
map("n", "<C-Up>",    ":resize +2<CR>")
map("n", "<C-Down>",  ":resize -2<CR>")
map("n", "<C-Left>",  ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- esc
map("i", "ii", "<Esc>")

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = function(desc) return { buffer = event.buf, desc = desc } end
    map("n", "gd",         vim.lsp.buf.definition,     opts("Go to definition"))
    map("n", "gD",         vim.lsp.buf.declaration,    opts("Go to declaration"))
    map("n", "gr",         vim.lsp.buf.references,     opts("References"))
    map("n", "gi",         vim.lsp.buf.implementation, opts("Go to implementation"))
    map("n", "K",          vim.lsp.buf.hover,          opts("Hover docs"))
    map("n", "<leader>lr", vim.lsp.buf.rename,         opts("Rename"))
    map("n", "<leader>la", vim.lsp.buf.code_action,    opts("Code action"))
    map("n", "<leader>lf", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end,                                               opts("Format file"))
    map("n", "<leader>ld", vim.diagnostic.open_float,  opts("Diagnostic detail"))
    map("n", "[d",         vim.diagnostic.goto_prev,   opts("Prev diagnostic"))
    map("n", "]d",         vim.diagnostic.goto_next,   opts("Next diagnostic"))
  end
})

-- File explorer
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Explorer toggle" })
map("n", "<leader>o", ":Neotree focus<CR>",  { desc = "Explorer focus" })

-- FZF
map("n", "<leader>ff", ":Files<CR>",   { desc = "Files" })
map("n", "<leader>fg", ":Rg<CR>",      { desc = "Grep" })
map("n", "<leader>fb", ":Buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fh", ":History<CR>", { desc = "History" })
