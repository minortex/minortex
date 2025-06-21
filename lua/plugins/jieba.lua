return {
  "noearc/jieba.nvim",
  vscode = true,
  dependencies = { "noearc/jieba-lua" },
  opts = {
    use_default_mappings = false,
  },
  -- 使用 lazy.nvim 的 'priority' 和 'config' 的特殊方式来确保路径修复在插件加载前执行
  priority = 1000, -- 确保这个配置比其他插件更早处理
  config = function(_, opts)
    -- --- 终极修复代码 ---
    -- 目标: 强行将插件及其依赖的目录添加到 Neovim 的 runtimepath。
    --       这是最底层的路径, Neovim 从它派生出用于搜索 .lua 和 .dll 的路径。

    -- 1. 获取 Neovim 的标准数据目录, lazy.nvim 就安装在这里面
    local data_path = vim.fn.stdpath('data')
    local sep = package.config:sub(1, 1) -- 自动获取路径分隔符, 在 Windows 上是 '\'

    -- 2. 构建插件的绝对路径
    local jieba_nvim_path = table.concat({ data_path, 'lazy', 'jieba.nvim' }, sep)
    local jieba_lua_path = table.concat({ data_path, 'lazy', 'jieba-lua' }, sep)

    -- 3. 将这些路径添加到 runtimepath 的最前面, 确保它们被优先搜索
    vim.o.runtimepath = jieba_nvim_path .. ',' .. vim.o.runtimepath
    vim.o.runtimepath = jieba_lua_path .. ',' .. vim.o.runtimepath

    -- 4. 重置 Lua 加载器的缓存, 以便它能感知到 runtimepath 的变化
    --    这是非常关键的一步！
    package.loaded['jieba_nvim'] = nil
    package.loaded['jieba'] = nil
    vim.cmd([[runtime plugin/jieba.lua]]) -- 有些插件可能依赖这个, 尝试执行
    -- --- 修复代码结束 ---

    -- 现在可以安全地调用 setup 了
    local status_ok, jieba_nvim = pcall(require, "jieba_nvim")
    if not status_ok then
      vim.notify("jieba.nvim: 终极修复失败！请检查诊断信息。", vim.log.levels.ERROR)
      -- 打印出关键路径以供调试
      print("--- FINAL DEBUG ---")
      print("Runtimepath: " .. vim.o.runtimepath)
      return
    end

    jieba_nvim.setup(opts)

    -- 设置键位映射
    vim.keymap.set({ "x", "n" }, "b", '<cmd>lua require("jieba_nvim").wordmotion_b()<CR>', { noremap = false, silent = true, desc = "Jieba [B]ackward" })
    vim.keymap.set({ "x", "n" }, "w", '<cmd>lua require("jieba_nvim").wordmotion_w()<CR>', { noremap = false, silent = true, desc = "Jieba [W]ord" })
    vim.keymap.set({ "x", "n" }, "e", '<cmd>lua require("jieba_nvim").wordmotion_e()<CR>', { noremap = false, silent = true, desc = "Jieba [E]nd of Word" })
    vim.keymap.set({ "x", "n" }, "ge", '<cmd>lua require("jieba_nvim").wordmotion_ge()<CR>', { noremap = false, silent = true, desc = "Jieba [gE]nd of Word backward" })

    vim.notify("jieba.nvim: 插件已通过终极修复成功加载！", vim.log.levels.INFO)
  end,
}