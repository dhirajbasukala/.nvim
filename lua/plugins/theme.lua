return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "shaunsingh/nord.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "oxfist/night-owl.nvim", priority = 1000 },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "night-owl",
    },
  },
}
