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
let g:mkdp_browser = 'firefox'
nmap <C-p> <Plug>MarkdownPreviewToggle

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


nnoremap <C-n> :NvimTreeToggle<CR>


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
]])

require("plugins")
require("null-ls_nvim")
require("user/telescopenov22")
require("mason").setup()
require("auto-save_nvim")
vim.keymap.set("n", "<Leader><Leader>", ":source $MYVIMRC<cr>")
