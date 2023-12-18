set number
set mouse="a"

syntax on

set tabstop=2
set shiftwidth=2
set expandtab

call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'alligator/accent.vim'
call plug#end()

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

set ignorecase
set smartcase

let g:accent_colour = 'red'
let g:accent_no_bg = 1
colorscheme accent

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

vmap <C-y> "+y
nmap <C-s> :w<CR>
nmap <C-t> :terminal<CR>
nmap <C-e> :Ex<CR>
nnoremap c :!clang % -o %:r && ./%:r <CR>
nnoremap ru :!rustc % -o %:r && %:r <CR>

set laststatus=2
set statusline=
set statusline+=\ %f%y                      " file name [ file type ]
set statusline+=%=                          " switch right side
set statusline+=\ Porn\ folder:\ 6.9Gb\ -\  " cool stat (idea from Tsoding)
set statusline+=%l/%L\                      " actual line / total lines
