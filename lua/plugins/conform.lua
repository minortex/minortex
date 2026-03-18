return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      markdown = { "autocorrect" },
    },
    --- 使用 autocorrect 来进行格式化
    --- 先执行：
    --- bun add -g autocorrect-node
    formatters = {
      autocorrect = {
        command = "autocorrect",
        args = { "autocorrect", "--fix", "--stdin", "--quiet" },
        stdin = true,
      },
    },
  },
}
