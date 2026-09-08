return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    document_color = {
      enabled = true,
      kind = "inline", -- "inline" | "foreground" | "background"
      inline_symbol = "󰝤 ",
      debounce = 200,
    },
    conceal = {
      enabled = false,
      symbol = "󱏿",
      highlight = { fg = "#38BDF8" },
    },
    custom_filetypes = {},
  },
  keys = {
    { "<leader>cts", "<cmd>TailwindSort<cr>", desc = "Tailwind: sort classes (buffer)" },
    { "<leader>ctS", "<cmd>TailwindSortSelection<cr>", mode = "v", desc = "Tailwind: sort classes (selection)" },
    { "<leader>ctc", "<cmd>TailwindConcealToggle<cr>", desc = "Tailwind: toggle conceal" },
    { "<leader>ctn", "<cmd>TailwindNextClass<cr>", desc = "Tailwind: next class region" },
    { "<leader>ctp", "<cmd>TailwindPrevClass<cr>", desc = "Tailwind: prev class region" },
    { "<leader>cto", "<cmd>TailwindColors<cr>", desc = "Tailwind: color picker (Telescope)" },
  },
}
