set sw=2 sts=2 ts=8
map <F5> :wall\|mak % %<CR>
map! <F5> <ESC><F5>

if (matchend(bufname("%"),"test.rb") >-1) || (matchend(bufname("%"), "tests.rb") > -1)
	comp rubyunit
else
	comp ruby
end

let &l:path = ".," . $PWD . "/**,". &l:path
