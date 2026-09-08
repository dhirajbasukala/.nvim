return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  keys = {
    {
      "<leader>df", -- open/switch to diffview
      function()
        local lib = require("diffview.lib")
        local view = lib.get_current_view()
        if view then
          -- we are already on the Diffview tab => so close it
          vim.cmd("DiffviewClose")
        elseif next(lib.views) ~= nil then
          -- A Diffview exits on another tab => jumpt to it
          vim.api.nvim_set_current_tabpage(lib.views[1].tabpage)
        else
          vim.cmd("DiffviewOpen")
        end
      end,
      desc = "Toggle/Focus Diffview window",
    },
    -- Add a keymap to open Diffview with a specific command
    {
      "<leader>gdh",
      function()
        vim.cmd("DiffviewOpen HEAD~1..HEAD") -- Example: compare current state to last commit
      end,
      desc = "Diff with last commit",
    },
  },
}
