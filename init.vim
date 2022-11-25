set nu
set relativenumber
map <F2> GoDate: <Esc>:read !date<CR>kJ
let mapleader = ","
map <Leader>A  oanother line<Esc>

lua << EOF
require('plugins')
require('vimtolua')
require('user/telescopenov22')
vim.keymap.set("n", "<Leader><Leader>", ":source $MYVIMRC<cr>")
EOF

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
