return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local jdtls = require("jdtls")

      -- Path JDK dan JDTLS
      local jdk_path = "C:/Program Files/Eclipse Adoptium/jdk-21.0.9.10-hotspot"
      local jdtls_path = jdk_path .. "/jdt-language-server-latest"

      -- Workspace folder otomatis berdasarkan nama project
      local workspace_dir = vim.fn.stdpath("data") .. "/jdtls/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

      local config = {
        cmd = {
          jdk_path .. "/bin/java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.level=ALL",
          "-Xmx1G",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          jdtls_path .. "/plugins/org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar",
          "-configuration",
          jdtls_path .. "/config_win",
          "-data",
          workspace_dir,
        },
      }

      jdtls.start_or_attach(config)
    end,
  },
}
