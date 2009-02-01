filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.

map <F2> :wall \|!ctags -R<CR>
map! <F2> <ESC><F2>

map <F5> :wall \|:Rake<CR>
map! <F5> <ESC><F5>

" Add recently accessed projects menu (project plugin)
set viminfo^=!

"Visual Bell no Sound
set noerrorbells  " No noise.
set visualbell

" Mouse selection except in command mode
set mouse=ivn  " Mouse in all modes

" Minibuffer Explorer Settings
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
 
" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>
 
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
 
syntax enable

" ADDITIONAL CONFIGS

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
" colorscheme vividchalk  " Uncomment this to set a default theme
 
" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab
set ignorecase smartcase
 
" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
" Show $ at end of line and trailing space as ~
"set list
"set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
"set novisualbell  " No blinking .
set laststatus=2  " Always show status line.
 
" gvim specific
set mousehide  " Hide mouse after chars typed
