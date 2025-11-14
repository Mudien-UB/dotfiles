return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "javascriptreact",
            "typescriptreact",
            "javascript",
            "typescript",
            "vue",
            "svelte",
            "astro",
          },
        },
      },
    },
  },
}
