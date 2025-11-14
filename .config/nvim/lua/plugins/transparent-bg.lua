return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      local transparent = require("transparent")

      transparent.setup({
        enable = true,
        extra_groups = {
          "NormalFloat",
          "TelescopeNormal",
          "TelescopeBorder",
          "NvimTreeNormal",
          "SignColumn",
          "LineNr",
          "CursorLine",
        },
      })

      vim.cmd("TransparentEnable")
      local is_enabled = true

      vim.api.nvim_create_user_command("UIEnableTransparency", function()
        vim.cmd("TransparentEnable")
        is_enabled = true
        vim.notify("UI Transparency: ENABLED", vim.log.levels.INFO)
      end, {})

      vim.api.nvim_create_user_command("UIDisableTransparency", function()
        vim.cmd("TransparentDisable")
        is_enabled = false
        vim.notify("UI Transparency: DISABLED", vim.log.levels.WARN)
      end, {})

      vim.keymap.set("n", "<leader>ut", function()
        if is_enabled then
          vim.cmd("UIDisableTransparency")
        else
          vim.cmd("UIEnableTransparency")
        end
      end, { desc = "Toggle UI Transparency" })
    end,
  },
}
