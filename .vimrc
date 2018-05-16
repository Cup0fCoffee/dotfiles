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

" remove delay in tmux

" tabfix

" filetype

" textwrap
set tw=80

" mapping for russian layout
