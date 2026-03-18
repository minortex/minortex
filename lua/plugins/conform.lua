return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      markdown = { "autocorrect" },
    },
    --- 使用 autocorrect 来进行格式化
    --- 先执行：
    --- 能用包管理器的，尽量用。
    --- 否则用包装过的
    --- uv tool install autocorrect-py
    formatters = {
      autocorrect = {
        command = "autocorrect",
        args = { "autocorrect", "--fix", "--stdin", "--quiet" },
        stdin = true,
      },
    },
  },
}
