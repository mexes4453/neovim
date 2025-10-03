-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp", -- for completion capabilities
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Keymaps when LSP attaches
    local on_attach = function(_, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }
      local map = vim.keymap.set
      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "gr", vim.lsp.buf.references, opts)
      map("n", "gD", vim.lsp.buf.declaration, opts)      -- go to declaration
      map("n", "gi", vim.lsp.buf.implementation, opts)   -- go to implementation
      map("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, opts) -- format buffer
      map("n", "[d", vim.diagnostic.goto_prev, opts)     -- jump to previous diagnostic
      map("n", "]d", vim.diagnostic.goto_next, opts)     -- jump to next diagnostic
      map("n", "<leader>e", vim.diagnostic.open_float, opts) -- show diagnostics in float
      map("n", "<leader>q", vim.diagnostic.setloclist, opts) -- put diagnostics in loclist
            
    end

    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",    -- C/C++
        "pyright",   -- Python
        "ts_ls",  -- JavaScript/TypeScript
        "bashls",    -- Bash
        "dartls",    -- Dart
      },
      automatic_installation = true,
    })

     -- Servers
     local servers = { "clangd", "pyright", "ts_ls", "bashls", "dartls" }
     for _, s in ipairs(servers) do
       lspconfig[s].setup({
         on_attach = on_attach,
         capabilities = capabilities,
       })
    end
  end,
}
    

