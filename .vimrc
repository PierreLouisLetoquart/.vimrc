" few basics
set number

syntax on

set tabstop=2
set shiftwidth=2
set expandtab

" pluggins using vim Plug
call plug#begin()

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'alligator/accent.vim'

call plug#end()

" minimalist lsp config
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  nmap <buffer> gi <plug>(lsp-definition)
  nmap <buffer> gd <plug>(lsp-declaration)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gl <plug>(lsp-document-diagnostics)
  nmap <buffer> <f2> <plug>(lsp-rename)
  nmap <buffer> <f3> <plug>(lsp-hover)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" few basics
set ignorecase
set smartcase

" color scheme
let g:accent_colour = 'red'
let g:accent_no_bg = 1

colorscheme accent

" vanilla autoclose brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" basic keymaps
vmap <C-y> "+y
nmap <C-s> :w<CR>
nmap <C-t> :terminal<CR>
nmap <C-e> :Ex<CR>
nnoremap c :!clang % -o %:r && ./%:r <CR>
nnoremap r :!rustc % -o %:r && %:r <CR>
