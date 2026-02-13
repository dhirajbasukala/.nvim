if true then
  return {}
end

return {

  -- Import the Copilot extra
  { import = "lazyvim.plugins.extras.coding.copilot" },
  { import = "lazyvim.plugins.extras.coding.copilot-chat" }, -- Optional: Add Copilot Chat
  { import = "lazyvim.plugins.extras.ui.edgy" }, -- Optional: Better UI for Chat-- { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.lang.typescript" },
  { import = "lazyvim.plugins.extras.util.project" },
  { import = "lazyvim.plugins.extras.ui.mini-starter" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
}
