local opts = { noremap = true, silent = true }
--key leader: This like ctrl in "ctrl+ p" for printing
--            In this case, space serves the purpose of
--            ctrl as the lead key.
vim.g.mapleader = " "

-- keymap : args ( <mode>, <keybind>, <cmd> )
--               ( normal, 'spacebar + cd', :Ex )
-- In normal mode, pressing "spacebar + cd' performs the same action
-- as ":Ex" which opens the directory while working on a file in nvim.
vim.keymap.set("n", "<leader>cd", ":Ex<CR>")


vim.keymap.set("n", "<C-q>", "<C-v>", { desc = "alternative ctrl block selection" }) 

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move lines up in visual selection" })

-- move to next search result and center the cursor on the screen
vim.keymap.set("n", "n", "nzzzv")
-- move to previous search result and center the cursor on the screen
vim.keymap.set("n", "N", "Nzzzv")

-- indent selected lines 
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<leader>cl", ":nohl<CR>", {desc="clear search highlight", silent=true})

