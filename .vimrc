set cursorline
set nocompatible                " choose no compatibility with legacy vi
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Raimondi/delimitMate'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'xero/sourcerer.vim'
Plugin 'bling/vim-airline'
Plugin 'slim-template/vim-slim'
Plugin 'mileszs/ack.vim'
Plugin 'rizzatti/dash.vim'
" Snippet engine
Plugin 'SirVer/ultisnips'
" Snippet repo
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'
Plugin 'scrooloose/syntastic'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'vimwiki/vimwiki'
" Plugins for clojure
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'vim-scripts/paredit.vim'
"Plugins for JS
Plugin 'pangloss/vim-javascript'
" Test run mapping
Plugin 'janko-m/vim-test'
Plugin 'dleonard0/pony-vim-syntax'
"
Plugin 'mbbill/undotree'

Plugin 'lambdatoast/elm.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" load file type plugins + indentation
filetype plugin indent on    " required

" sets a better regexp engine
set re=1

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

colorscheme gruvbox

set number                          " show line numbers
set relativenumber

"" CMD+T
let g:CommandTMaxHeight=15      " show 15 results maximum

" Store temporary files in a central spot
" set backup
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Fix slow O inserts
:set timeout timeoutlen=500 ttimeoutlen=0

" git fugitive
noremap <leader>gb :Gblame<CR>

" Powerline stuff
set laststatus=2   " Always show the statusline
"bet statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
" let g:Powerline_symbols = 'fancy'

"Ag

let g:ackprg = 'ag --nogroup --nocolor --column'

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  "     " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

nnoremap <leader>re :set relativenumber!<CR>

" mapping for line moving
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" faster screen redraw
set ttyfast

"remap leader to ',' which is much easier than '\'"
let mapleader = ","

" Open NERDTree with [<leader>d]
map <Leader>d :NERDTreeToggle<CR>

" " Show current file in the NERDTree hierarchy
map <Leader>D :NERDTreeFind<CR>]

" Better split management, kept in sync with tmux' mappings of (<prefix>| and
" <prefix>-)
noremap <leader>- :sp<CR><C-w>j
noremap <leader>\| :vsp<CR><C-w>l)

"Update CTags
map <Leader>ct :!ctags -R --exclude=.git --exclude=log --exclude=.svn --verbose=yes * <CR>

" Exit out of insert with jj
inoremap jj <ESC>

" Allows editing of crontabs. They require you write files in place
autocmd filetype crontab setlocal nobackup nowritebackup

" Automatically source this file after it's saved
autocmd! bufwritepost .vimrc source ~/.vimrc

"map Ack! current word to ,a
noremap <Leader>ac :Ack! <cword><cr>

set clipboard=unnamed " use clipboard for yank

" show matching brackets for a moment
"set showmatch
" how many tenths of a second to blink matching brackets for
"set matchtime=5

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
" Enable folding, but by default make it act like folding is off, because
" folding is annoying in anything but a few rare cases
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on folding
set foldenable

" Make folding indent sensitive
set foldmethod=indent

" Don't autofold anything (but I can still fold manually)
set foldlevel=100

" don't open folds when you search into them
set foldopen-=search

" don't open folds when you undo stuff
set foldopen-=undo

" Auto reload files on change
set autoread

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Don't use backup and swap files
set nobackup
set noswapfile

map <left> :bp<CR>
map <right> :bn<CR>
map <down> :bd<CR>

"make solarized compatible with terminal
" let g:solarized_termcolors=256

"Support for 256 colors
"set t_Co=256

"show trailing whitespace
"set list

nmap <C-t> :CtrlP<CR>
"autocomplete for commands
set wildmenu
set wildmode=list:longest,full

"remap for running tests from vim
map ,t :w\|:!bundle exec ruby -Itest %<cr>

" show line on 80 char word limit
set colorcolumn=80

"fold guides
"set foldcolumn=1

" save shortcut shortcut
map <leader>w :w<cr>"

" Make space more useful
nnoremap <space> za

" define a sign
autocmd BufEnter * sign define dummy
" populate gutter with empty sign
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

"Turn on airline
let g:airline#extensions#tabline#enabled = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-f>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"autocmd FileType ruby,eruby
"      \ set foldmethod=expr |
"      \ set foldexpr=getline(v:lnum)=~'^\\s*#'
"
let test#ruby#rspec#executable = 'zeus rspec'
" Test running mappings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
