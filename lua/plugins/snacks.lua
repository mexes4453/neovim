return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {

        },
        keys = {
            { "<leader>lg", function() require("snacks").lazygit() end, desc = "lazygit"},
            { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "lazygit logs"},
            { "<leader>es", function() require("snacks").explorer() end, desc = "open snacks explorer"},
            { "<leader>rN", function() require("snacks").rename.rename_file() end, desc = "Fast rename current file"},
            { "<leader>dB", function() require("snacks").bufdelete() end, desc = "Delete or close buffer (confirm)"},

            --snack pickers
            { "<leader>pf", function() require("snacks").picker.files() end, desc = "Find files"},
            { "<leader>pc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find config files"},
            { "<leader>ps", function() require("snacks").picker.grep() end, desc = "Grep word"},
            { "<leader>pws", function() require("snacks").picker.grep_word() end, desc = "Search visual selection or word", mode = {"n", "x"}},
            { "<leader>pk", function() require("snacks").picker.keymaps({ layout="ivy"}) end, desc = "Search keymaps " },

            { "<leader>th", function() require("snacks").picker.colorschemes({ layout="ivy"}) end, desc = "Pick color schemes" },
            { "<leader>vh", function() require("snacks").picker.help() end, desc = "Help pages" },
        }

    }
}
