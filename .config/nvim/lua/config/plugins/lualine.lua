local colors = {
  blue   = '#80A0FF',
  cyan   = '#79DAC8',
  black  = '#080808',
  white  = '#D0D0D0',
  red    = '#FF5189',
  violet = '#D183E8',
  greybg   = '#505050',
  inactive = '#808080',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.greybg },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.inactive },
  },
}

return {
   "nvim-lualine/lualine.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      require("lualine").setup({
         options = {
            theme = bubbles_theme,
            component_separators = '',
            section_separators = '',
            globalstatus = true,
         },
         sections = {
            lualine_a = { { 'mode', separator = { left = '' } } },
            lualine_b = { { 'location', separator = { right = '' } } },
            lualine_c = {},
            lualine_x = {
               'branch',
            },
            lualine_y = {},
            lualine_z = { {
               function()
                  local root = vim.fn.getcwd()
                  return vim.fn.fnamemodify(root, ":t")
               end,
               separator = { left = '', right = '' },
            } },
         },
         tabline = {
            lualine_c = { {
               'buffers',
               mode = 2,
               icons_enabled = false,
               symbols = {
                  alternate_file = '',
               },
            } },
         },
         winbar = {
            lualine_a = { {
               'filename',
               path = 1,
               separator = { left = '', right = '' },
            } },
            lualine_c = {
               'diff',
            },
         },
         inactive_winbar = {
            lualine_a = { {
               'filename',
               path = 1,
               separator = { left = '', right = '' },
            } },
         },
      })
   end,
} 

