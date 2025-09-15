--key leader: This like ctrl in "ctrl+ p" for printing
--            In this case, space serves the purpose of
--            ctrl as the lead key.
vim.g.mapleader = " "

-- keymap : args ( <mode>, <keybind>, <cmd> )
--               ( normal, 'spacebar + cd', :Ex )
-- In normal mode, pressing "spacebar + cd' performs the same action
-- as ":Ex" which opens the directory while working on a file in nvim.
vim.keymap.set("n", "<leader>cd", ":Ex<CR>")

vim.keymap.set("n", "<C-q>", "<C-v>")

