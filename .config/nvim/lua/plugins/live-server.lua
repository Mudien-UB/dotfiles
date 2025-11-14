-- setup live-server
return {
  {
    "aurum77/live-server.nvim",
    config = function()
      require("live_server").setup({
        browser_command = "",
        quiet = false,
        no_css_inject = false,
      })
    end,

    keys = {
      { "<leader>v", group = "Live Server" },

      { "<leader>vs", "<cmd>LiveServerStart<cr>", desc = "Start Live Server" },
      { "<leader>vS", "<cmd>LiveServerStop<cr>", desc = "Stop Live Server" },
    },
  },
}
