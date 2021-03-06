set number                    "Line numbers are good
set relativenumber              "Relative numbers ( navigation )
set cursorline                  "Highlight horizontal line
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set guioptions-=T               "Remove toobar
set guioptions-=m               "Remove menu
" set timeoutlen=2000

" Disable new line on end file
set binary
set noeol

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" add jbuilder syntax highlighting
" au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
" let mapleader=","
" let maplocalleader=","
nnoremap <space> <Nop>
map <space> <leader>

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set expandtab

" by default, the indent is 2 spaces.
set shiftwidth=2
set tabstop=2
set softtabstop=2
set linespace=2

" for js/coffee/jade files, 4 spaces
" autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab

" XML
" au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
autocmd BufWritePre * :%s/\s\+$//e

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
" set ignorecase      " Ignore case when searching...
set smartcase
nnoremap <silent> <Esc><Esc> :let @/=""<CR> " Cancel highlighting

" ================ Theme ============================

set guifont=*
if has("gui_gtk2")
  set guifont=Monospace\ 11
else
  set guifont=Monaco:h15
end

" ============= copy and paste ======================

vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
noremap Y y$
vmap y ygv<Esc>

" duplicate lines ( up, down )
vmap <leader>d yo<ESC>p
vmap <leader>D YO<ESC>P

" ====== force do use h,j,k,l navigation keys =======

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" ====== Files =======

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qall<CR>
nnoremap <leader>a :saveas %
nnoremap <leader>E :edit!<CR>
nnoremap <leader><Tab> :b#<cr>

" Move lines around easily
" nnoremap <leader>k :m-2<cr>==
" nnoremap <leader>j :m+<cr>==
" xnoremap <leader>k :m-2<cr>gv=gv
" xnoremap <leader>j :m'>+<cr>gv=gv

" Substitute
vnoremap <leader>r "hy:%s/<C-r>h//Ig<left><left><left>
vnoremap <leader>R :s//Ig<left><left><left>

" Editing
nnoremap <leader>C ^C
