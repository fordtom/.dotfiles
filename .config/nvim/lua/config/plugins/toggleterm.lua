return {
   'akinsho/toggleterm.nvim',
   version = "v2.*",
   opts = {
      direction = "float",
      open_mapping = [[<C-\>]],
      float_opts = {
         border = "curved",
         width = function() return math.floor(vim.o.columns * 0.95) end,
         height = function() return math.floor(vim.o.lines * 0.85) end,
         winblend = 0,
      },
   },
}
