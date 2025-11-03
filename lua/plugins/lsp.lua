return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable old/legacy Vue servers
        vuesls = false,
        vue_ls = false, -- We'll re-enable below as vue_ls
        ts_ls = false,
        tsserver = false,
        -- vtsls: Handles TS/JS/scripts in Vue (with @vue/typescript-plugin for <script> defs)
        vtsls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
          },
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")(fname)
          end,
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = {
                  {
                    name = "@vue/typescript-plugin",
                    location = vim.fn.stdpath("data")
                      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                    languages = { "vue", "javascript", "typescript" },
                    configNamespace = "typescript",
                    enableForWorkspaceTypeScriptVersions = true,
                  },
                },
              },
            },
          },
          single_file_support = false, -- Ensures project-wide defs (fixes import resolution)
        },

        -- Tailwind: For class go-to-def/hover (optional but fits your stack)
        tailwindcss = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "package.json")(
              fname
            )
          end,
        },

        -- Fix ESLint root_dir (your existing)
        eslint = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern(
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json",
              "eslint.config.js",
              "package.json"
            )(fname) or util.find_git_ancestor(fname)
          end,
        },
      },
    },
  },
}
