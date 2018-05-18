" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
" Standart settings
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
" Theme
colo seoul256
let g:seoul256_background = 239

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

call ToggleNumbers()

" 256 color support
set t_Co=256

" remove delay in tmux
" source: https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0

" tabfix
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" filetype
filetype on
filetype plugin on

" syntax highligh
syntax on

" textwrap
set tw=80

" show a vertical line at 80th char
set colorcolumn=80

" mapping for russian layout

" turn of 'vi' compatability; makes vim more useful
set nocompatible

" highlight the cursor line
set cursorline

" don't show the current mode
set noshowmode

" osx clipboard
set clipboard=unnamed

" searching settings
set ignorecase
set smartcase
set incsearch
set hlsearch

" enable mouse in all modes
set mouse=a

" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
" Plugins (using vim-plug; source: https://github.com/junegunn/vim-plug)
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
call plug#begin('~/.vim/plugged')


" lightline (status and tab bar)
Plug 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" surround.vim (helps with brackets and quotes)
" Plug 'tpope/vim-surround'

" tmuxline
Plug 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0
" Current settings are 'Tmuxline lightline minimal'

" nerdcommenter
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" vim tmux navigator
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_save_on_switch = 1 " save on leave

" fugitive
Plug 'tpope/vim-fugitive'

" fzf.vim
Plug '/Users/Maxim/.fzf'
Plug 'junegunn/fzf.vim'
map <leader>b :Buffers<CR>

" vim indent guides
Plug 'nathanaelkane/vim-indent-guides'
set ts=4 sw=4 et
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" vim better whitespace
Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" vim-xmark
Plug 'junegunn/vim-xmark'

" close-tag
Plug 'alvan/vim-closetag'

" sytastic
" Plug 'scrooloose/syntastic'

" vim-polyglot
Plug 'sheerun/vim-polyglot'

" vim-gitgutter
Plug 'airblade/vim-gitgutter'

" limelight
Plug 'junegunn/limelight.vim'

" goyo
Plug 'junegunn/goyo.vim'
nmap <leader>g :Goyo<CR>

function! s:goyo_enter()
    call ToggleNumbers()
    Limelight
endfunction

function! s:goyo_leave()
    call ToggleNumbers()
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" vim-slashed (improves searching)
Plug 'junegunn/vim-slash'
noremap <plug>(slash-after) zz


call plug#end()
