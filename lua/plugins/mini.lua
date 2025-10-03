-- Minifile is a file explorer
return {
    -- Mini Nvim
    {"echasnovski/mini.nvim", version = false },

    -- File explorer (this works properly with oil) from mini
    {
       'echasnovski/mini.files',
        config = function()
            local MiniFiles = require("mini.files")
            MiniFiles.setup({
                mappings = {
                    -- Map Both Enter and L to enter directories or open files
                    go_in = "<CR>", 
                    go_in_plus = "L", 
                    go_out = "-", 
                    go_out_plus = "H", 
                },
            })
            vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", {desc="Toggle mini file explorer"})
            vim.keymap.set("n", "<leader>ef", function()
                MiniFile.open(vim.api.nvim_buf_get_name(0), false)
                MiniFile.reveal_cwd()
            end, { desc="Toggle into currently opened file"})
        end
    },
    {
        "echasnovski/mini.splitjoin",
        config = function()
            local miniSplitJoin = require("mini.splitjoin")

            miniSplitJoin.setup({
                mappings = { toggle = " "}, -- Disable default mapping
            })

            vim.keymap.set({"n", "x"}, "<leader>spl", function() miniSplitJoin.split() end, {desc="split arguments"})
            vim.keymap.set({"n", "x"}, "<leader>spj", function() miniSplitJoin.join() end, {desc="Join arguments"})

        end

    }
}
