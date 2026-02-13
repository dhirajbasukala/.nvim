return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "shaunsingh/nord.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "oxfist/night-owl.nvim", priority = 1000 },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      -- Optional: Configure Kanagawa. For example, to use a different theme.
      -- See `:help kanagawa.nvim` for all options.
      theme = "wave", -- 'wave', 'lotus', or 'dragon'
      compile = false, -- enable compiling the colorscheme (optional)
      undercurl = true, -- enable undercurls (optional)
      -- ... other configurations
    },
    -- Set this to `true` if you want to set the colorscheme immediately
    -- after the plugin is loaded, or omit this to manually set it later.
    -- lazy = false,
    -- priority = 1000, -- Set a higher priority to load it early (optional)
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "night-owl",
    },
  },
}
