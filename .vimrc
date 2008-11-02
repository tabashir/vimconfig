set nocompatible
set hidden

syntax on
filetype plugin indent on

map <F2> :wall \|!ctags -R<CR>
map! <F2> <ESC><F2>

" install matchit
source $VIMRUNTIME/macros/matchit.vim

