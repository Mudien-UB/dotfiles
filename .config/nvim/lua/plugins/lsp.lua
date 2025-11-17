return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Emmet LSP untuk HTML, CSS, JS/TS, framework
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "javascriptreact",
            "typescriptreact",
            "javascript",
            "typescript",
            "vue",
          },
        },

        -- TypeScript/JavaScript LSP
        tsserver = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("package.json")(fname)
          end,
          single_file_support = true,
          settings = {
            typescript = { inlayHints = { includeInlayParameterNameHints = "literal" } },
            javascript = { inlayHints = { includeInlayParameterNameHints = "all" } },
          },
        },

        -- JSON LSP
        jsonls = {
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              format = { enable = true },
              validate = { enable = true },
            },
          },
        },

        -- ESLint LSP
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
          },
        },

        -- Tailwind CSS LSP
        tailwindcss = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "svelte",
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "tailwind.config.js",
              "tailwind.config.cjs",
              "tailwind.config.mjs",
              "tailwind.config.ts",
              "postcss.config.js",
              "postcss.config.cjs",
              "postcss.config.mjs",
              "postcss.config.ts"
            )(fname)
          end,
          settings = {
            tailwindCSS = {
              classAttributes = { "class", "className", "classList", "ngClass" },
              experimental = {
                classRegex = {
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                },
              },
              lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidScreen = "error",
                invalidVariant = "error",
              },
            },
          },
        },

        -- HTML LSP
        html = {
          filetypes = { "html", "templ" },
        },

        -- CSS/SCSS/Less LSP
        cssls = {
          settings = {
            css = { validate = true, lint = { unknownAtRules = "ignore" } },
            scss = { validate = true, lint = { unknownAtRules = "ignore" } },
            less = { validate = true, lint = { unknownAtRules = "ignore" } },
          },
        },

        -- CPP
        clangd = {},
      },
    },
  },
}
