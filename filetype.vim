augroup ragel
  au!
  autocmd BufRead,BufNewFile  *.rl  setfiletype ragel
augroup END

augroup markdown
  au!
  autocmd BufRead,BufNewFile	*.mkd	setfiletype mkd
  autocmd BufRead		*.mkd	set ai formatoptions=tcroqn2 comments=n:>
augroup END

augroup nemerle
  au!
  autocmd BufNewfile,BufRead *.n setfiletype nemerle
augroup END

augroup todo
  au!
  autocmd BufNewFile,BufRead todo setfiletype todo
augroup END

augroup taskjuggler 
  au!
  autocmd BufNewFile,BufRead *.tjp,*.tji setfiletype tjp 
augroup END 


"augroup ruby
"  au!
"augroup END
