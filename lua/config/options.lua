-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Fix gf for JS/Vue imports: resolve @ alias, strip quotes, add .vue support
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "javascript", "javascriptreact", "vue" },
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(bufnr, "path", ".,src") -- Search current dir + src/
    vim.api.nvim_buf_set_option(bufnr, "suffixesadd", ".js;.jsx;.vue") -- Auto-append extensions if omitted

    -- Lua function for includeexpr: strip quotes, resolve @/ -> src/
    _G.gf_resolve = function(fname)
      local path = vim.fn.fnamemodify(fname, ":r") -- Remove extension if present (we'll add back via suffixesadd)
      path = path:gsub('^"', ""):gsub('"$', "") -- Strip surrounding quotes
      path = path:gsub("^@/", "src/") -- Resolve Vite @ alias
      return vim.fn.fnamemodify(path, ":p") -- Make it absolute-ish for gf
    end
    vim.api.nvim_buf_set_option(bufnr, "includeexpr", "v:lua.gf_resolve(v:fname)")
  end,
})
