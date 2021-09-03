" tabfix
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" filetype
filetype on
filetype plugin on

" syntax highligh
syntax on

" textwrap
set tw=79

" show a vertical line at 80th char
set colorcolumn=80

" turn of 'vi' compatability; makes vim more useful
set nocompatible

" highlight the cursor line
set cursorline

" don't show the current mode
set noshowmode

" searching settings
set ignorecase
set smartcase
set incsearch
set hlsearch

" enable mouse in all modes
set mouse=a

" minimal number of screen lines to keep above and below the cursor
set scrolloff=8


nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>


call plug#begin('~/.vim/plugged')

let g:seoul256_background = 239
colo seoul256
Plug 'junegunn/seoul256.vim'

" lightline (status and tab bar)
Plug 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" vim-slashed (improves searching)
Plug 'junegunn/vim-slash'
noremap <plug>(slash-after) zz

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


" line numbering
" source 1: https://jeffkreeftmeijer.com/vim-number/
" source 2: https://vi.stackexchange.com/questions/4120/how-to-enable-disable-an-augroup-on-the-fly
function! ToggleNumbers()
    if !exists('#numbertoggle#BufEnter')
        set number relativenumber
        augroup numbertoggle
          autocmd!
          autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
          autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
        augroup END
    else
        set nonumber norelativenumber
        augroup numbertoggle
            autocmd!
        augroup END
    endif
endfunction

if !exists('#numbertoggle#BufEnter')
    call ToggleNumbers()
endif


" function for creating Scratch buffers
function! Scratch()
    split
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    "setlocal nobuflisted
    "lcd ~
    file scratch
endfunction
