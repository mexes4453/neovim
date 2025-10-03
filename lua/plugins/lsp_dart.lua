-- lua/plugins/lsp-dart.lua
return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").dartls.setup({
      cmd = { "dart", "language-server", "--protocol=lsp" },
      filetypes = { "dart" },
      init_options = {
        closingLabels = true,
        flutterOutline = true,
        onlyAnalyzeProjectsWithOpenFiles = true,
        outline = true,
        suggestFromUnimportedLibraries = true,
      },
      settings = {
        dart = {
          completeFunctionCalls = true,
          showTodos = true,
        },
      },
    })
  end,
}

