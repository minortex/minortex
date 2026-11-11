-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = ""
vim.opt.spelllang = { "en", "cjk" }
vim.opt.conceallevel = 0
-- 开启 list 模式，显示不可见字符
vim.opt.list = true
vim.opt.listchars = {
  space = "·", -- 空格显示为中间点
  tab = "▸ ", -- Tab 显示为箭头加空格
  trail = "·", -- 行尾空格显示为点
  nbsp = "␣", -- 非断空格显示为开口方块
  lead = "·", -- 前导空格（缩进）显示为点
  extends = "›",
  precedes = "‹",
}
