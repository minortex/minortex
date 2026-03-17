return {
  {
    "nvim-mini/mini.surround",
    version = false,
    opts = {
      custom_surroundings = {
        ["b"] = {
          output = { left = "**", right = "**" },
        },
      },
      mappings = {
        add = "gs", -- Add surrounding in Normal and Visual modes
        delete = "ds", -- Delete surrounding
        replace = "cs", -- Replace surrounding
      },
    },
  },
}
