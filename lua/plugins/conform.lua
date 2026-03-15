--- 使用 pangu 来进行格式化
--- 先执行：
--- uvx pangu
--- uv tool install pangu
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      markdown = { "pangu" }, -- 这样保存时就会自动执行 pangu 格式化
    },
    formatters = {
      pangu = {
        command = "pangu",
        args = { "-" }, -- 从标准输入读取并输出
      },
    },
  },
}
