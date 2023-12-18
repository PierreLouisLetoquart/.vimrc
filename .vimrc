let mapleader = " "        " Define the leader key
let maplocalleader = ","   " Define the local leader key

set number
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
set ai

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

vmap <Leader>y "+y                                          " copy to system clipboard
nmap <LocalLeader>s :w<CR>                                  " ctrl+s like
nmap <Leader>t :terminal<CR>                                " open terminal in split view
nmap <Leader>pv :Ex<CR>                                     " go to file tree
nnoremap <Leader>i gg=G<C-o><C-o>                           " indent from gg to G
nnoremap <LocalLeader>c :!clang % -o %:r && ./%:r <CR>      " compile + exec curr buffer (for C)
nnoremap <LocalLeader>r :!rustc % -o %:r && %:r <CR>        " compile + exec curr buffer (for Rust)
nnoremap <Leader>j 10j                                      " move 10 lines down
nnoremap <Leader>k 10k                                      " move 10 lines up

set laststatus=2
set statusline=
set statusline+=\ %f%y                      " file name [ file type ]
set statusline+=%=                          " switch right side
set statusline+=\ Porn\ folder:\ 6.9Gb\ -\  " cool stat (idea from Tsoding)
set statusline+=%l/%L\                      " actual line / total lines
