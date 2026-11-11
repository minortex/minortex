return {
  {
    "folke/flash.nvim",
    opts = {
      highlight = {
        backdrop = false,
        matches = false,
      },
      modes = {
        char = {
          jump_labels = false,
          autohide = true,
          multi_line = false,
          config = function(opts)
            -- flash 默认 char 配置逻辑
            opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")
            opts.jump_labels = opts.jump_labels
              and vim.v.count == 0
              and vim.fn.reg_executing() == ""
              and vim.fn.reg_recording() == ""

            -- f/F/t/T 的单键：英文原字符 + 小鹤双拼该键的声母汉字集合
            local flypy = require("flash-zh.flypy")
            local motion = require("flash.plugins.char").motion
            opts.search.mode = function(str)
              local body
              local cls = str:find("^%a$") and flypy.char1patterns[str]
              if cls then
                body = "\\(" .. cls .. "\\|" .. str .. "\\)"
              else
                body = "\\V" .. str:gsub("\\", "\\\\")
              end
              local pattern = "\\C"
              if not opts.multi_line then
                pattern = pattern .. ("\\%%%dl"):format(vim.api.nvim_win_get_cursor(0)[1])
              end
              if motion == "t" then
                pattern = pattern .. ".\\ze" .. body
              elseif motion == "T" then
                pattern = pattern .. body .. "\\zs."
              else
                pattern = pattern .. body
              end
              return pattern, pattern
            end
          end,
        },
      },
    },
    keys = {
      -- 禁用 LazyVim 默认的 s 绑定，交给 flash-zh
      { "s", mode = { "n", "x", "o" }, false },
    },
  },
  {
    "rainzm/flash-zh.nvim",
    vscode = true,
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
