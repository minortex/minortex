-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
-- 将插入模式下的 Ctrl+c 映射为 Esc，以确保能正确触发 InsertLeave 等事件
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode properly" })

-- insert time quickly via F5
vim.keymap.set("n", "<F5>", function()
  local timestamp = vim.fn.strftime("%Y-%m-%dT%H:%M:%S+08:00")
  vim.api.nvim_put({ timestamp }, "", false, true)
end, { noremap = true, silent = true, desc = "Insert ISO Timestamp" })
