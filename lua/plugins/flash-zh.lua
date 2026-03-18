return {
  {
    "folke/flash.nvim",
    opts = {
      highlight = {
        backdrop = false,
        matches = false,
      },
    },
    keys = {
      -- 禁用 LazyVim 默认的 s 绑定
      { "s", mode = { "n", "x", "o" }, false },
    },
  },
  {
    "rainzm/flash-zh.nvim",
    event = "VeryLazy",
    dependencies = "folke/flash.nvim",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash-zh").jump({
            chinese_only = true,
          })
        end,
        desc = "Flash between Chinese",
      },
    },
  },
}
