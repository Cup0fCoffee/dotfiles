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

if !exists('#numbertoggle#BufEnter')
    call ToggleNumbers()
endif

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
set tw=79

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

nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

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
Plug 'tpope/vim-surround'

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

" syntastic
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

function! SyntasticCustomToggle()
    :SyntasticToggle
    if g:syntastic_mode_map["mode"] == "active"
        :SyntasticCheck
    endif
endfunction

noremap <leader>s :call SyntasticCustomToggle()<CR>

" custom checkers
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_mode_map = { 'mode': 'passive',
	      \                      'active_filetypes': [] }

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

Plug 'tpope/vim-unimpaired'

Plug 'mattn/emmet-vim'

Plug 'pangloss/vim-javascript'

Plug 'MaxMEllon/vim-jsx-pretty'


" Trying out lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

let g:lsp_settings_servers_dir = '~/.vim-lsp-settings/servers'
let g:lsp_settings_filetype_javascript = ['eslint-language-server']

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    " nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" END Trying out lsp

call plug#end()


function! Scratch()
    split
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    "setlocal nobuflisted
    "lcd ~
    file scratch
endfunction
