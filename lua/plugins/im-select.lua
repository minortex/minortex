return {
  "keaising/im-select.nvim",
  vscode = true,
  config = function()
    local is_windows = vim.uv.os_uname().sysname:find("Windows") ~= nil
    require("im_select").setup({
      default_im_select = is_windows and 1033 or "keyboard-us",

      default_command = is_windows and "im-select.exe" or "fcitx5-remote",

      -- 以下是默认事件，非常适合日常使用，一般无需修改。
      -- 在进入普通模式、命令行模式或 Neovim 获得焦点时，切换到默认输入法。
      set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },

      -- 在进入插入模式时，恢复到你之前使用的输入法。
      set_previous_events = { "InsertEnter" },

      -- 如果找不到 fcitx5-remote，是否在启动时保持安静，不显示错误信息
      keep_quiet_on_no_binary = true,
    })
  end,
}
