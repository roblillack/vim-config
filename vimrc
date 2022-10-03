set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'Valloric/YouCompleteMe'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'fatih/vim-go'
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 0

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
imap <F8> <ESC>:TagbarToggle<CR>

"Plugin 'git://github.com/altercation/vim-colors-solarized.git'
"Plugin 'desert-warm-256'

Plugin 'roblillack/vim-bufferlist'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'axvr/photon.vim'

" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"endif
colorscheme antiphoton

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.

"colorscheme desert-warm-256

set guioptions=ae

"set guifont=-burningsoda-emaruco-medium-r-normal--16-160-75-75-c-80-iso10646-1

"call pathogen#infect()

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
if !has('nvim')
  set ttymouse=xterm2
endif
" backspace geht auch an speziellen positionen
set backspace=indent,eol,start
" turn on pattern highlighting when searching
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full
set completeopt=longest,menuone

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

"set <C-Backspace>=[rC;BS~
"imap <ESC>[rC;BS~ <C-Backspace>

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

if has('gui_running')
  " hint, use `defaults write org.vim.MacVim MMNativeFullScreen 0` to force
  " MacVim to NOT use Lion's freaky native fullscreen support
  map <D-Return> :set invfu<CR>
  imap <silent> <D-Return> <C-O>:set invfu<CR>
  set fuoptions=maxvert,maxhorz
endif


" window/tab movement
map <C-Tab> :tabnext<CR>
" map <D-Right> :tabnext<CR>
" imap <D-Right> <C-O>:tabnext<CR>
" map <D-Left> :tabprevious<CR>
" imap <D-Left> <C-O>:tabprevious<CR>

map <silent> <D-Backspace> :hide<CR>
map <silent> <D-Delete> :hide<CR>
map <silent> <D-Down> :wincmd j<CR>
map <silent> <D-Up> :wincmd k<CR>
map <silent> <D-Left> :wincmd h<CR>
map <silent> <D-Right> :wincmd l<CR>

map <silent> <D-\> :vsplit<CR>
map <silent> <D-A-\> :split<CR>

map <silent> <D-A-Left> :tabprev<CR>
map <silent> <D-A-Right> :tabnext<CR>

let macvim_skip_cmd_opt_movement = 1

if has('gui_running')
  " taken from here: https://gist.github.com/imiric/9038570
  let g:airline_powerline_fonts = 1
  set cursorline
  set guifont=Envy\ Code\ R\ for\ Powerline:h12
  "set guifont=Anonymous\ Pro\ for\ Powerline:h13
  colorscheme solarized
  "hi CursorLine guibg=#f6f6ff term=NONE
  "autocmd WinEnter * setlocal cursorline
  "autocmd WinLeave * setlocal nocursorline
  "
  "autocmd InsertEnter * highlight CursorLine guibg=#ffeeff
  "autocmd InsertLeave * highlight CursorLine guibg=#f6f6ff
  "set colorcolumn=81
  "hi ColorColumn guibg=#f6f6ff
else
  hi User1 term=bold cterm=bold ctermbg=red ctermfg=white gui=bold guifg=white guibg=red
  hi User2 term=reverse,bold ctermbg=DarkBlue ctermfg=White cterm=Bold gui=bold guifg=#ffffff guibg=#6699cc
  hi StatusLine term=reverse ctermbg=blue ctermfg=White cterm=NONE gui=NONE guibg=#6699cc guifg=#ffffff
  hi StatusLineNC term=reverse ctermbg=black ctermfg=lightgray cterm=NONE gui=NONE guibg=#dddddd guifg=#555555
  hi! link VertSplit StatusLineNC
  hi ModeMsg ctermbg=Red ctermfg=White cterm=Bold
  hi LineNr ctermbg=LightGray ctermfg=Black guifg=#555555 guibg=#f6f6f6
  autocmd InsertEnter * highlight User2 guibg=red ctermbg=red
  autocmd InsertLeave * highlight User2 guibg=#6699cc ctermbg=blue
  autocmd InsertEnter * highlight StatusLine guibg=red ctermbg=red
  autocmd InsertLeave * highlight StatusLine guibg=#6699cc ctermbg=blue
  set statusline=%<\ %y\ %2*%f%*%=%c,%l/%L%R%H\ %1*%m%*
endif

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
  if !exists('omnifunc') || !col || getline('.')[col-1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction

"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"autocmd FileType c setlocal omnifunc=ccomplete#Complete
"autocmd FileType go setlocal omnifunc=go#complete#Complete

"map <ScrollWheelDown> 
