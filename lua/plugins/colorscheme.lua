return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "shaunsingh/nord.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "oxfist/night-owl.nvim", name = "night-owl", priority = 2000 },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "night-owl",
    },
  },
}
