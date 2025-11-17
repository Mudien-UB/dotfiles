return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "css",
        "scss",
        "less",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "lua",
        "vue",
      },
      highlight = { enable = true },
      indent = { enable = true },
      autopairs = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    opts = {},
  },
}
