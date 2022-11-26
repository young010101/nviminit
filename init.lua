-- https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
-- up vote: 2099, Nov 25

vim.cmd([[
set tabstop=4
set shiftwidth=4
set expandtab

set nu
set relativenumber
let mapleader = ","

lua << EOF
require('init')
EOF

map <F2> GoDate: <Esc>:read !date<CR>kJ
map <Leader>A  oanother line<Esc>

" settings of markdown plugin
"let g:mkdp_browser = 'firefox'
nmap <C-p> <Plug>MarkdownPreviewToggle

" use <tab> for trigger completion and navigate to the next complete item



" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


" float window try, nothing new, to delete
function! Stmpfw() abort
    let buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(buf, 0, -1, v:true, ["test", "text"])
    let opts = {'relative': 'cursor', 'width': 10, 'height': 2, 'col': 0,
        \ 'row': 1, 'anchor': 'NW', 'style': 'minimal'}
    let win = nvim_open_win(buf, 0, opts)
    " optional: change highlight, otherwise Pmenu is used
    call nvim_win_set_option(win, 'winhl', 'Normal:MyHighlight')
endfunction
]])

vim.g.mkdp_browser = "microsoft-edge-dev"
require("plugins")
require("null-ls_nvim")
require("user/telescopenov22")
require("user/lsp-config")
-- require("user/nvim-cmp")
require("user/coc-init")
require("user/nvimtree")
require("mason").setup()
require("auto-save_nvim")
require("Comment").setup()
require("lualine").setup()
require("indent_blankline").setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = true,
})
vim.cmd("colorscheme nightfox")
vim.keymap.set("n", "<Leader><Leader>", ":source $MYVIMRC<cr>")
