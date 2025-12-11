local M = {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        sql = { "sqlfluff" },
      },
    },
    ft = { "html", "css", "scss", "javascript", "typescript", "json", "cpp", "c", "sql" },
  },
}

vim.api.nvim_set_keymap("n", "<leader>f", ":ConformFormat<CR>", { noremap = true, silent = true })
return M
