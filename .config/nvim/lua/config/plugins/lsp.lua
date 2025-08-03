return {
   "neovim/nvim-lspconfig",
   dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
   },
   config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
         ensure_installed = { "pyright", "clangd", "zls" },
         automatic_installation = true,
      })

      local lspconfig = require("lspconfig")

      -- Python
      lspconfig.pyright.setup({
         settings = {
            python = {
               analysis = {
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
               },
            },
         },
         on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
         end
      })

      -- C/C++
      lspconfig.clangd.setup({
         filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cla" },
         cmd = { "clangd", "--log=verbose", "--background-index" },
         root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
     })
   end,
}
