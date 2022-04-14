set nu
set relativenumber
map <F2> GoDate: <Esc>:read !date<CR>kJ
let mapleader = ","
map <Leader>A  oanother line<Esc>

lua require('plugins')

" settings of markdown plugin
let g:mkdp_browser = 'firefox'
nmap <C-p> <Plug>MarkdownPreviewToggle
