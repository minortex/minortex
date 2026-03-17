--- 使用 pangu 来进行格式化
--- 先执行：
--- uvx pangu
--- uv tool install pangu
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      markdown = { "autocorrect" },
    },
    formatters = {
      autocorrect = {
        command = "autocorrect",
        args = { "autocorrect", "--fix", "--stdin", "--quiet" },
        stdin = true,
      },
    },
  },
}
