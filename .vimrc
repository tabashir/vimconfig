filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.

map <F2> :wall \|!ctags -R --extra=+f<CR>
map! <F2> <ESC><F2>

map <F3> :NERDTreeToggle<CR>
map! <F3> <ESC><F3>

map <F4> :BD <CR>
map! <F4> <ESC><F4>

map <F5> :wall<CR>:Rake<CR>
map! <F5> <ESC><F5>

map <S-F5> :wall \|:!ruby %<CR>
map! <S-F5> <ESC><S-F5>

"map <F9> :s/^/#/<CR>
map <F9> :TComment<CR> 
map! <F9> <ESC><F9>

"map <C-F9> :s/^#//<CR>
map <C-F9> :TCommentBlock<CR> 
map! <C-F9> <ESC><C-F9>

map <F11> :TlistToggle<CR>
map! <F11> <ESC><F11>

" Centre screen on current line stuff
map <space> zz
map n nzz
map N Nzz

runtime xmlpretty.vim
command! -range=% Xmlpretty :call XmlPretty(<line1>, <line2>)
map <C-K><C-F> :Xmlpretty<CR>

" Add recently accessed projects menu (project plugin)
"set viminfo^=!

" set viminfo file to remember just current folder info
command! GlobalInfo :set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
command! LocalInfo :set viminfo=%100,'100,/100,h,\"500,:100,n.viminfo

"Tcomment no extra indents
command! SetRubyComment :call TCommentDefineType("ruby", "#%s")

"Visual Bell no Sound
set noerrorbells  " No noise.
set visualbell

" Mouse selection except in command mode
set mouse=in  " Mouse in all modes

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

"au VimLeavePre * mksession! project.session
command! WQ :mksession! project.session | qall!

" ADDITIONAL CONFIGS

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set tabstop=2 expandtab shiftwidth=2 softtabstop=2


"Colours
" colorscheme vividchalk  " Uncomment this to set a default theme
hi CurrentLine term=bold cterm=bold gui=bold
 
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
set scrolloff=5
set autoread

" Python Setup
autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

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
