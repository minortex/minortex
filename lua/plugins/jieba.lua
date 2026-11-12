return {
  "kkew3/jieba.vim",
  vscode = true,
  branch = "release",
  build = ":call jieba_vim#install()",
  dependencies = "tpope/vim-repeat",
  init = function()
    vim.g.jieba_vim_lazy = 1
    -- 只接管小写 motion / text object；
    -- W/E/B/gE/iW/aW 保留 Vim 原生 WORD 语义（jieba 的中文分词会阻断 WORD 合并）
    vim.g.jieba_vim_keymap = 0
  end,
  config = function()
    local keymap = function(modes, lhs, plug)
      vim.keymap.set(modes, lhs, ("<Plug>(Jieba_%s)"):format(plug), { remap = true })
    end
    for _, k in ipairs({ "w", "b", "e", "ge" }) do
      keymap({ "n", "x", "o" }, k, k)
    end
    for _, k in ipairs({ "iw", "aw" }) do
      keymap({ "x", "o" }, k, k)
    end
    keymap("i", "<C-W>", "C_w")
  end,
}
