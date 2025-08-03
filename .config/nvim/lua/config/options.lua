-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Colorscheme
vim.cmd[[colorscheme catppuccin]]

vim.filetype.add({
    extension = {
        cla = "c",
    },
})

vim.api.nvim_set_hl(0, "@lsp.type.variable", { link = "Identifier" })
vim.api.nvim_set_hl(0, "@lsp.type.property", { link = "Identifier" })
vim.api.nvim_set_hl(0, "@lsp.type.operator", { link = "Keyword" })

vim.api.nvim_create_autocmd({ "BufLeave", "InsertLeave", "FocusLost" }, {
   callback = function()
      if vim.bo.modified and vim.bo.modifiable and vim.bo.buftype == "" then
         vim.cmd("silent! write")
      end
   end,
})
