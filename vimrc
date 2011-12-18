set guioptions=al
"set guifont=-burningsoda-emaruco-medium-r-normal--16-160-75-75-c-80-iso10646-1

" syntax-highlighting an
syntax on
syntax sync fromstart

"set nospell
" standardmäßig zeilenzahlen erstmal nicht anzeigen
set nonumber
" ruler anzeigen (zeile/spalte)
set ruler
" zeigt statuszeile _immer_ an
set laststatus=2
" ein tab ist 8 zeichen breit, und das bleibt gefälligst auch so!
set tabstop=8
" keine tabs mehr verwenden, auch wenn wir <tabstop> spaces hintereinander haben
set expandtab
" DAS ist die einrückbreite
set shiftwidth=2
set softtabstop=2
" „test“
" wir wollen tabs beim bearbeiten »aufbrechen« können
set nosmarttab
" ja, wir wollen automatischen einrücken, nach enter.
set autoindent
" kein cin, da smartindent auch bei nicht-c sprachen klappt
set nocin
set smartindent
set cinkeys=0{,0},:,0#,!<Tab>,!^F
" ordentliche mouse-unterstütung, auch in screen
set mouse=a
set ttymouse=xterm2
" backspace geht auch an speziellen positionen
set backspace=indent,eol,start

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" when using list, keep tabs at their full width and display `arrows':
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
" (Character 187 is a right double-chevron, and 183 a mid-dot.)

" automatically search function definitions
"au! CursorHold *.[ch] nested exe "silent! psearch " . expand("<cword>")

" do not unload buffers, which are not shown in a windows atm
set hidden

" set some broken keymaps
map <ESC>[14~ <F4>
map <ESC>[18~ <F6>

map <silent> <C-N> :bnext<CR>
map <silent> <C-P> :bprev<CR>
" F2 toggled zeilennummern
map <silent> <F2> :set invnu<CR>
imap <silent> <F2> <C-O>:set invnu<CR>
" F4 zum kompletten entfernen eines buffers
map <F4> :bwipeout<CR>
noremap <silent> <F5> :cal VimCommanderToggle()<CR>
map <F6> :bnext<CR>
imap <F6> <C-O>:bnext<CR>
map <F11> :echo "F11"<CR>

map <C-S> :w<CR>
imap <C-S> <ESC><C-S>
map <C-Q> :q<CR>
imap <C-Q> <ESC><C-Q>

map <C-J> gq}``
imap <C-J> <C-O>gq}``

map <D-Return> :set invfu<CR>
imap <silent> <D-Return> <C-O>:set invfu<CR>

" window/tab movement
map <C-Tab> :tabnext<CR>
" map <D-Right> :tabnext<CR>
" imap <D-Right> <C-O>:tabnext<CR>
" map <D-Left> :tabprevious<CR>
" imap <D-Left> <C-O>:tabprevious<CR>

map <D-Backspace> :hide<CR>
map <D-Down> :wincmd j<CR>
map <D-Up> :wincmd k<CR>
map <D-Left> :wincmd h<CR>
map <D-Right> :wincmd l<CR>

set statusline=%<\ %y\ %2*%f%*%=%c,%l/%L%R%H\ %1*%m%*
hi User1 term=bold ctermbg=Red ctermfg=white cterm=Bold
hi User2 term=reverse,bold ctermbg=DarkBlue ctermfg=White cterm=Bold gui=bold guifg=#ffff00 guibg=#555555
hi StatusLine term=reverse ctermbg=blue ctermfg=White cterm=NONE gui=NONE guibg=#555555 guifg=#ffffff
hi StatusLineNC term=reverse ctermbg=black ctermfg=lightgray cterm=NONE
hi ModeMsg ctermbg=Red ctermfg=White cterm=Bold
hi LineNr ctermbg=LightGray ctermfg=Black guifg=#555555 guibg=#eeeeee

hi Statement ctermfg=DarkBlue cterm=Bold
hi Function ctermfg=Black cterm=Bold
hi link rubyDefine Statement
" let g:showfuncctagsbin = "/usr/local/bin/exctags"

" taglist-plugin (http://www.geocities.com/yegappan/taglist/)
" let Tlist_Ctags_Cmd = "exctags"
" let Tlist_Compact_Format = 1
" let Tlist_File_Fold_Auto_Close = 1
" let Tlist_Auto_Highlight_Tag = 1
" let Tlist_Show_One_File = 1
" let Tlist_Show_Menu = 1
" let Tlist_Inc_Winwidth = 0
" let Tlist_Exit_OnlyWindow = 1

" BufferList stuff
map <silent> <F3> :call BufferList()<CR>
imap <silent> <F3> <ESC><F3>
let g:BufferListWidth = 25
let g:BufferListMaxWidth = 50
hi BufferSelected term=reverse ctermfg=white ctermbg=red cterm=bold guifg=#ffffff guibg=#000000
hi BufferNormal term=NONE ctermfg=black ctermbg=darkcyan cterm=NONE guifg=#000000 guibg=#7777cc

" hi Normal ctermfg=black term=bold

function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction

function! OmniTabWrapper()
  let col = col('.')
  if omnifunc != '' || !col || getline('.')[col-1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction

"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>
inoremap <tab> <c-r>=OmniTabWrapper()<cr>
inoremap <c-space> <c-x><c-o>

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
