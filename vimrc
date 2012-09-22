call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
set nocompatible  " We don't want vi compatibility.

" DISABLE ARROW KEYS
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
" END DISABLE ARROW KEYS

set showcmd
set timeoutlen=500
set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set wrap  " Line wrapping
set hlsearch  "search highlight
set tabstop=2 expandtab shiftwidth=2 softtabstop=2
set cursorline

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

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set laststatus=2  " Always show status line.

"Visual Bell no Sound
set noerrorbells  " No noise.
set visualbell

" Mouse selection 
set mouse +=a

"set viminfo=%100,'100,/100,h,@500,:100
set viminfo='1000,f1,<500

"highlighting
hi CursorLine term=bold cterm=bold gui=bold

"Colours
" set background=dark
" let g:solarized_termcolors=16
" "let g:solarized_visibility = "high"
" "let g:solarized_contrast = "high"
" set t_Co=16
" colorscheme solarized

command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
command! -range=% -nargs=0 Tab2Space execute "<line1>,<line2>s/^\\t\\+/\\=substitute(submatch(0), '\\t', repeat(' ', ".&ts."), 'g')"
command! -range=% -nargs=0 Space2Tab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"

"easy syntax swapping
command! SyntaxPerl set syntax=perl   ai et ts=4 sw=4 tw=0<CR>
command! SyntaxPython set syntax=python ai et ts=4 sw=4 tw=0<CR>
command! SyntaxRuby set syntax=ruby   ai et ts=2 sw=2 tw=0<CR>

" Ruby Setup
au BufEnter *.rb set syntax=ruby ai et ts=2 sw=2 tw=0
"let g:rubytest_in_quickfix = 1 
"Tcomment no extra indents
command! SetRubyComment :call TCommentDefineType("ruby", "#%s")
"Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

" Python Setup
autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

command! -range=% Xmlpretty :call XmlPretty(<line1>, <line2>)

" Add recently accessed projects menu (project plugin)
"set viminfo^=!

" set viminfo file to remember just current folder info
command! GlobalInfo :set viminfo='1000,f1,<500,n~/.viminfo
command! LocalInfo :set  viminfo='1000,f1,<500,n.viminfo
 
"au VimLeavePre * mksession! project.session
command! WQ :mksession! project.session | qall!
"
" KEY MAPPING

" insert line below with enter
"map <CR> O<Esc>j
" insert line above with enter
map <CR> o<Esc>

inoremap <Nul> <C-n>

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

" buffer copy/paste
vmap <F7> "+ygv"zy`>
vmap <S-F7> "+p
nmap <S-F7> "+p
imap <S-F7> <ESC>"+p

noremap <silent> <F9> :TComment<CR> 
noremap! <silent> <F9> <ESC><F9>

noremap <silent> <C-F9> :TCommentBlock<CR> 
noremap! <silent> <C-F9> <ESC><C-F9>

noremap <silent> <F11> :TlistToggle<CR>
noremap! <silent> <F11> <ESC><F11>

"noremap gt :tag <C-R><C-W><CR>
noremap gt :tj <C-R><C-W><CR>

noremap err :cope <CR> <CR> :ccl <CR>

noremap <silent> ,f <ESC>:CommandT<CR>
noremap <silent> ,b <ESC>:CommandTBuffer<CR>
noremap <silent> ,j <ESC>:CommandTJump<CR>

map <Leader>k <Plug>RubyTestRun
map <Leader>kk <Plug>RubyFileRun
"map <Leader>l <Plug>RubyLastTestRun

call arpeggio#load()

command! ToggleWrap :set invwrap

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

function! PerforceDirList()
    let mylist = getline('.')
    let vcscommand = "~/bin/p4 dirs " . mylist . "/*"
    exe "normal O\n"
    exe "normal J"
    exe ":r! ". vcscommand
    exe "normal o"
endfunc

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction
