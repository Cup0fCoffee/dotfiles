" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
" Standart settings
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
" Theme
colo seoul256
let g:seoul256_background = 239

" linenumbering
" source: https://jeffkreeftmeijer.com/vim-number/
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" 256 color support
set t_Co=256

" remove delay in tmux
" (source: https://www.johnhawthorn.com/2012/09/vi-escape-delays/)
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

call plug#end()
