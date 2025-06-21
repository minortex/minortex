return {
  "keaising/im-select.nvim",
  vscode = true,
  config = function()
    require("im_select").setup({
      -- 【重要】在这里设置你的默认（英文）输入法。
      -- 这个值应该是你在步骤 2 中用 `fcitx5-remote -n` 命令查到的英文输入法名称。
      -- Fcitx5 通常是 "keyboard-us"。
      default_im_select = "keyboard-us",

      -- 插件会自动检测 fcitx5-remote，一般不需要手动设置。
      -- 但如果你的 `fcitx5-remote` 不在标准路径下，可以在这里指定完整路径。
      -- default_command = "fcitx5-remote",

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
