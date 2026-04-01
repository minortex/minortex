-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*/joplin-desktop/*.md", -- 匹配 Joplin 的临时目录
  callback = function()
    vim.opt_local.backup = false
    vim.opt_local.writebackup = false
    vim.opt_local.backupcopy = "yes"
    -- 顺便可以开启自动保存，体验更好
    -- vim.opt_local.autowriteall = true
  end,
})
