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

        -- vue_ls: Handles templates/styles (forwards TS requests to vtsls for integrated defs)
        -- vue_ls = {
        --   filetypes = { "vue" },
        --   root_dir = function(fname)
        --     local util = require("lspconfig.util")
        --     return util.root_pattern("package.json", "vue.config.js", "vite.config.js", ".git")(fname)
        --   end,
        --   init_options = {
        --     vue = {
        --       hybridMode = false, -- Takeover mode: No AST duplication
        --     },
        --   },
        --   on_init = function(client)
        --     -- Forward TS requests to vtsls (critical for go-to-def across Vue/TS)
        --     client.handlers["tsserver/request"] = function(_, result, context)
        --       local vtsls_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
        --       if #vtsls_clients == 0 then
        --         vim.notify("No vtsls client found; vue_ls defs may fail.", vim.log.levels.WARN)
        --         return
        --       end
        --       local vtsls_client = vtsls_clients[1]
        --       local param = unpack(result)
        --       local id, command, payload = unpack(param)
        --       vtsls_client:exec_cmd({
        --         title = "vue_request_forward",
        --         command = "typescript.tsserverRequest",
        --         arguments = { command, payload },
        --       }, { bufnr = context.bufnr }, function(_, r)
        --         local response = r and r.body
        --         local response_data = { { id, response } }
        --         client:notify("tsserver/response", response_data)
        --       end)
        --     end
        --   end,
        -- },

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
