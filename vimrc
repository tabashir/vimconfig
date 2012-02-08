call pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible  " We don't want vi compatibility.
set showcmd
set timeoutlen=500

" Generic Configs

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set hlsearch  "search highlight
set tabstop=2 expandtab shiftwidth=2 softtabstop=2

"Colours
" colorscheme vividchalk  " Uncomment this to set a default theme
hi CurrentLine term=bold cterm=bold gui=bold
 
" Formatting 
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set ignorecase smartcase
set scrolloff=5
set autoread
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set textwidth=0

if has("autocmd")
  filetype indent on
endif

:command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
:command! -range=% -nargs=0 Tab2Space execute "<line1>,<line2>s/^\\t\\+/\\=substitute(submatch(0), '\\t', repeat(' ', ".&ts."), 'g')"
:command! -range=% -nargs=0 Space2Tab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set laststatus=2  " Always show status line.
 
" gvim specific
set mousehide  " Hide mouse after chars typed

" Remove menu bar
"set guioptions-=m

" Remove toolbar
set guioptions-=T

"Visual Bell no Sound
set noerrorbells  " No noise.
set visualbell

" Mouse selection 
set mouse +=a

" Syntax stuff
syntax enable

noremap <leader>spe :set syntax=perl   ai et ts=4 sw=4 tw=0<CR>
noremap <leader>spy :set syntax=python ai et ts=4 sw=4 tw=0<CR>
noremap <leader>sr  :set syntax=ruby   ai et ts=2 sw=2 tw=0<CR>

" Ruby Setup
au BufEnter *.rb set syntax=ruby ai et ts=2 sw=2 tw=0

" Python Setup
autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

"let g:rubytest_in_quickfix = 1 

runtime xmlpretty.vim
command! -range=% Xmlpretty :call XmlPretty(<line1>, <line2>)
noremap <C-K><C-F> :Xmlpretty<CR>

" Add recently accessed projects menu (project plugin)
"set viminfo^=!

" set viminfo file to remember just current folder info
command! GlobalInfo :set viminfo='1000,f1,<500,n~/.viminfo
command! LocalInfo :set  viminfo='1000,f1,<500,n.viminfo

"set viminfo=%100,'100,/100,h,@500,:100
set viminfo='1000,f1,<500

"Tcomment no extra indents
command! SetRubyComment :call TCommentDefineType("ruby", "#%s")

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
 
"au VimLeavePre * mksession! project.session
command! WQ :mksession! project.session | qall!
"
" KEY MAPPING

noremap <F2> :wall \|!ctags -R --extra=+f<CR>
noremap! <F2> <ESC><F2>

noremap <silent> <F3> :NERDTreeToggle<CR>
noremap! <silent> <F3> <ESC><F3>

noremap <silent> <F4> :Tlist <CR>
noremap! <silent> <F4> <ESC><F4>

noremap <S-Tab> <C-W><C-W>
noremap! <S-Tab> <C-W><C-W>

noremap <C-F5> :wall<CR>:!rake<CR>
noremap! <C-F5> <ESC><C-F5>

noremap <F5> :wall \|:!ruby %<CR>
noremap! <F5> <ESC><F5>

noremap <S-F5> :wall \|:.Rake!<CR>
noremap! <S-F5> <ESC><S-F5>

noremap <silent> <F9> :TComment<CR> 
noremap! <silent> <F9> <ESC><F9>

noremap <silent> <C-F9> :TCommentBlock<CR> 
noremap! <silent> <C-F9> <ESC><C-F9>

noremap <silent> <F11> :TlistToggle<CR>
noremap! <silent> <F11> <ESC><F11>


"noremap gt :tag <C-R><C-W><CR>
noremap gt :tj <C-R><C-W><CR>

inoremap <Nul> <C-n>

noremap err :cope <CR> <CR> :ccl <CR>

noremap <silent> <leader>f <ESC>:CommandT<CR>
noremap <silent> <leader>b <ESC>:CommandTBuffer<CR>
noremap <silent> <leader>j <ESC>:CommandTJump<CR>

map <Leader>k <Plug>RubyTestRun
map <Leader>kk <Plug>RubyFileRun

call arpeggio#load()
Arpeggio noremap \r <ESC>:CommandT<CR>
Arpeggio noremap \b <ESC>:CommandTBuffer<CR>
Arpeggio noremap \j <ESC>:CommandTJump<CR>

Arpeggio noremap \f <ESC>:Rfunctionaltest 
Arpeggio noremap \u <ESC>:Runittest 
Arpeggio noremap \m <ESC>:Rmodel 
Arpeggio noremap \c <ESC>:Rcontroller 
Arpeggio noremap \v <ESC>:Rview 
Arpeggio noremap \l <ESC>:Rlayout 

inoremap <Nul> <C-n>
noremap <silent> <C-H> <ESC>:set invhlsearch<CR>
noremap <silent> <C-N> <ESC>:set invwrap<CR>

" alt+n or alt+p to navigate between entries in QuickFix
noremap <silent> <M-p> :cp <cr>
noremap <silent> <M-n> :cn <cr>

" Centre screen on current line stuff
noremap <space> zz
noremap n nzz
noremap N Nzz


" Plugin Specific
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'
let g:SuperTabMappingTabLiteral = '<tab>'
let g:SuperTabDefaultCompletionType = "context"

let g:tcommentMapLeader1=''
let g:tcommentMapLeader2=''

noremap! ZQ WQ


