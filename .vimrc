filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.

map <F2> :wall \|!ctags -R --extra=+f<CR>
map! <F2> <ESC><F2>

map <F3> :NERDTreeToggle<CR>
map! <F3> <ESC><F3>

map <silent> <F4> :Tlist <CR>
map! <silent> <F4> <ESC><F4>

map <S-Tab> <C-W><C-W>
map! <S-Tab> <C-W><C-W>

map <F5> :wall<CR>:!rake<CR>
map! <F5> <ESC><F5>

map <S-F5> :wall \|:!ruby %<CR>
map! <S-F5> <ESC><S-F5>

map <C-F5> :wall \|:Rake!<CR>
map! <C-F5> <ESC><C-F5>

"map <F9> :s/^/#/<CR>
map <F9> :TComment<CR> 
map! <F9> <ESC><F9>

"map <C-F9> :s/^#//<CR>
map <C-F9> :TCommentBlock<CR> 
map! <C-F9> <ESC><C-F9>

map <F11> :TlistToggle<CR>
map! <F11> <ESC><F11>

map <Leader>kk :.Rake!<CR>
map <Leader>k <Plug>RubyTestRun
"map <Leader>tt <Plug>RubyFileRun

map gt :tag <C-R><C-W><CR>

inoremap <Nul> <C-n>

map err :cope <CR> <CR> :ccl <CR>

"let g:SuperTabMappingForward = '<nul>'
"let g:SuperTabMappingBackward = '<s-nul>'
let g:SuperTabMappingForward = '<c-space>'
"let g:SuperTabMappingBackward = '<s-c-space>'

let g:tcommentMapLeader1=''
let g:tcommentMapLeader2=''

map \\f :Rfunctionaltest 
map \\u :Runittest 
map \\m :Rmodel 
map \\c :Rcontroller 
map \\v :Rview 

"let g:rubytest_in_quickfix = 1 

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
command! GlobalInfo :set viminfo='1000,f1,<500,n~/.viminfo
command! LocalInfo :set  viminfo='1000,f1,<500,n.viminfo

"set viminfo=%100,'100,/100,h,@500,:100
set viminfo='1000,f1,<500

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
map ZQ WQ


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
"set cindent
"set smarttab
set ignorecase smartcase
set scrolloff=5
set autoread

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set textwidth=0

syntax on
 
if has("autocmd")
  filetype indent on
endif



:command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
:command! -range=% -nargs=0 Tab2Space execute "<line1>,<line2>s/^\\t\\+/\\=substitute(submatch(0), '\\t', repeat(' ', ".&ts."), 'g')"
:command! -range=% -nargs=0 Space2Tab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"

"let mapleader=","
map <leader>spe :set syntax=perl   ai et ts=4 sw=4 tw=0<CR>
map <leader>spy :set syntax=python ai et ts=4 sw=4 tw=0<CR>
map <leader>sr  :set syntax=ruby   ai et ts=2 sw=2 tw=0<CR>

" Ruby Setup
au BufEnter *.rb set syntax=ruby ai et ts=2 sw=2 tw=0

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

inoremap <Nul> <C-n>
