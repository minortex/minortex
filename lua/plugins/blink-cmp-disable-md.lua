return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      -- 这里是关键：修改所有 provider 的触发行为
      min_keyword_length = function()
        -- 如果是 markdown 文件，将触发长度设为一个很大的数（比如 99），相当于禁用自动弹出
        return vim.bo.filetype == "markdown" and 99 or 0
      end,
    },
  },
}
