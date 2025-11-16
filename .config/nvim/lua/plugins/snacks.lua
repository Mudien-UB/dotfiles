return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        files = {
          hidden = true,
          ignored = true,
        },
        explorer = {
          hidden = true,
        },
        grep = {
          hidden = true,
          ignored = false,
        },
      },
    },
    explorer = {
      enabled = true,
      show_hidden = true,
      root = false,
      filters = {
        dotfiles = false,
        gitignored = false,
      },
    },
  },
}
