-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "<leader>th", function()
--   local themes = { "gruvbox", "nord", "catppuccin" }
--   local current = vim.api.nvim_exec2("colorscheme", { output = true }).output:match("(%w+)") or "catppuccin"
--   local next_idx = (vim.tbl_contains(themes, current) and ((vim.fn.index(themes, current) + 1) % #themes + 1) or 1)
--   vim.cmd.colorscheme(themes[next_idx])
-- end, { desc = "Cycle themes" })
