set nocompatible
set hidden

syntax on
filetype plugin indent on

map <F2> :wall \|!ctags -R<CR>
map! <F2> <ESC><F2>

" install matchit
source $VIMRUNTIME/macros/matchit.vim

" Add recently accessed projects menu (project plugin)
set viminfo^=!
"  
" Minibuffer Explorer Settings
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"   
" alt+n or alt+p to navigate between entries in QuickFix
"   map <silent> <m-p> :cp <cr>
"   map <silent> <m-n> :cn <cr>
"    
" Change which file opens after executing :Rails command
"let g:rails_default_file='config/database.yml'
"     
"     syntax enable
