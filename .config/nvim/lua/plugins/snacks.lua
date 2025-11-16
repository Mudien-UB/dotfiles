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
    terminal = {
      snacks_win_opts = {
        position = "float",
        width = 0.8,
        height = 0.5,
        border = "rounded",
        keys = {
          hide = {
            "<Esc>",
            function(term)
              term:hide()
            end,
            mode = "t",
            desc = "Hide terminal",
          },
          close = { "q", "close", mode = "n", desc = "Close terminal" },
        },
      },
    },
  },
  keys = {
    {
      "<leader>T",
      function()
        local cwd = vim.fn.getcwd()
        local cmd = { "pwsh", "-NoLogo", "-Command", "Set-Location -LiteralPath '" .. cwd .. "'; pwsh" }

        require("snacks").terminal(cmd, {
          win = {
            position = "float",
            width = 0.8,
            height = 0.5,
            border = "rounded",
          },
        })
      end,
      desc = "open snacks terminal",
      mode = { "n", "t" },
    },
  },
}
