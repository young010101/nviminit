-- https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
-- up vote: 2099, Nov 25
vim.cmd([[
set tabstop=4
set shiftwidth=4
set expandtab

set nu
set relativenumber
let mapleader = ","
]])

require("plugins")
require("null-ls_nvim")
require("user/telescopenov22")
vim.keymap.set("n", "<Leader><Leader>", ":source $MYVIMRC<cr>")
