-- oil is file explorer that works just like vim editor.
return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons"},
    config = function()
        require("oil").setup({
            default_file_explorer = true, -- start up nvim with oil file explorer 
            columns = {},
            keymaps = {
                ["<C-h>"] = false,
                ["<C-c>"] = false, -- prevents the close of explorer
                ["<M-h>"] = "actions.select_split", -- prevents the close of explorer
                ["q"] = "actions.close", -- prevents the close of explorer
            },
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
            },
            skip_confirm_for_simple_edits = true,
        })
        --keymaps for oil
        -- open parent dir over current active window
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", {desc="open parent directory"})
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float, {desc="toggle float oil"})

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "oil",
            callback = function()
                vim.opt_local.cursorline = true
            end
        })
    end
}
