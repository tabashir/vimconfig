set sw=2 sts=2 ts=8
map <F5> :wall\|mak %<CR>
map! <F5> <ESC><F5>

if (matchend(bufname("%"),"test.rb") >-1) || (matchend(bufname("%"), "tests.rb") > -1)
	comp rubyunit
else
	comp ruby
end

let &l:path = ".," . $PWD . "/**,". &l:path

nmap <silent> <F9> :set operatorfunc=ToggleRubyComment<CR>g@
omap <silent> <F9> g@
imap <silent> <F9> <ESC><F9>

if (exists("*ToggleRubyComment") == 0)
  function ToggleRubyComment(type) range
	  let firstline = line("'[")
	  let lastline = line("']")
	  let line = getline(firstline)
	  if match(line, '^\s*#') > -1
		  execute firstline . "," . lastline . 'call RubyUncomment()'
	  else
		  execute firstline . "," . lastline . 'call RubyComment()'
	  endif
  endfunction
  
  function! RubyComment()
	  :s/^/#/e
  endfunction

  function! RubyUncomment()
	  :s/^\(\s*\)\#/\1/e
  endfunction
endif

