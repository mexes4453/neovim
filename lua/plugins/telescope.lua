return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make"},
        "nvim-tree/nvim-web-devicons",
        "andrew-george/telescope-themes",
    },

    config = function()
	    local telescope = require('telescope')
	    local actions = require('telescope.actions')
	    local builtin = require('telescope.builtin')

        telescope.load_extension("fzf")
        telescope.load_extension("themes")

        telescope.setup({
            defaults = {
                path_display = {"smart"},
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                    },
                },
                extensions = {
                    themes = {
                        enable_previewer = true,
                        enable_live_preview = true,
                        persist = {
                            enabled = true,
                            path = vim.fn.stdpath("config") .. "/lua/plugins/colors.lua",
                        },
                    }}
            }
        })
        --keymaps
	    vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Telescope find files' })
	    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = 'Telescope live grep' })
	    vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Telescope buffers' })
	    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Telescope help tags' })
	    vim.keymap.set('n', '<leader>fr', "<cmd>Telescope oldfiles<CR>", { desc='Fuzzy find recent files' })
	    vim.keymap.set('n', '<leader>ths', "<cmd>Telescope themes<CR>", {noremap = true, silent=true, desc='Telescope help tags' })
	    vim.keymap.set('n', '<leader>fwc', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, {noremap = true, silent=true, desc='Telescope help tags' })
    end
}
