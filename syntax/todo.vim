" Vim syntax file
" Language:     todo.txt
" Maintainer:   Robert Lillack <rob@burningsoda.com>
" Filenames:    todo todo.txt
" Last Change:  18th March 2007
" Web Page:     http://www.burningsoda.com
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match Keyword	"\(^\|\s\)\(+\|p:\)\zs\S\+\ze\(\s\|$\)"
syn match Constant      "\(^\|\s\)@\zs\S\+\ze\(\s\|$\)"
syn match Comment       "\(^\|\s\)\w\+:\zs\S\+\ze\(\s\|$\)"
syn match Number        "^([ABC*])\s\+"

let b:current_syntax = "todo"

" vim: ts=8

