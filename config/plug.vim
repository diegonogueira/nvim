syntax enable

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

call plug#begin()

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Lokaltog/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
Plug 'rizzatti/dash.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'chaoren/vim-wordmotion'
Plug 'mattn/emmet-vim'
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'elixir-lang/vim-elixir'
Plug 'kana/vim-altr'
Plug 'slim-template/vim-slim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'w0rp/ale'
Plug 'diegonogueira/Zenburn'
Plug 'trevordmiller/nova-vim'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" === Theme ===

" set background=dark
colorscheme nova

" === Fzf ===

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <leader>g :GGrep<Space>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" [Files] Extra options for fzf
"   e.g. File preview using Highlight
"        (http://www.andre-simon.de/doku/highlight/en/highlight.html)
let g:fzf_files_options =
  \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --color=always --line-number '.shellescape(<q-args>), 0, <bang>0)


" === NerdThree ===

map <leader>n :NERDTreeToggle<CR>
nmap <leader>N :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * wincmd l " move to left window
"nmap <leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" === Airline ===

set laststatus=2
let g:airline_highlighting_cache=1

" === Dash ===

:nnoremap <silent> <leader>dd :Dash<CR>
:nnoremap <leader>df :Dash<leader>

" === EasyMotion ===

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
map <leader>/ <Plug>(easymotion-s2)
" Move to word
map  <Leader>? <Plug>(easymotion-bd-w)
nmap <Leader>? <Plug>(easymotion-overwin-w)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" === Vim-test and neoterm ===

" let g:neoterm_autoscroll = 1
let g:neoterm_position = 'vertical'
let g:neoterm_size = 50
let g:neoterm_shell = "bash"
nnoremap <silent> <leader>tq :call neoterm#closeAll()<CR>

function! RunTest(cmd)
   call neoterm#open() " Opens the neoterm window
   call neoterm#normal('G') " Scroll to the end of the neoterm window
   call neoterm#clear() " Opens the neoterm window
   exec a:cmd
endfunction

" function! ToggleTerminalSize()
  " if g:neoterm_size == 40
    " let g:neoterm_size = 30
  " else
    " let g:neoterm_size = 40
  " end

  " call neoterm#close()
  " call neoterm#open()

  " execute ':wincmd j'
" endfunction

let test#filename_modifier = ":~"
let test#strategy = "neoterm"

nmap <silent> <leader>tl :call RunTest('TestNearest')<CR>
nmap <silent> <leader>tb :call RunTest('TestFile')<CR>
nmap <silent> <leader>ta :call RunTest('TestSuite')<CR>
nmap <silent> <leader>t. :call RunTest('TestLast')<CR>
" nmap <silent> <leader>to :call ToggleTerminalSize()<CR>


" === Vim wordmotion ===

let g:wordmotion_mappings = {
  \ 'w' : '<leader>l',
  \ 'b' : '<leader>h',
  \ 'e' : '<leader>j',
  \ 'ge' : '<leader>k',
  \ 'aw' : '<leader>l',
  \ 'iw' : 'i<space>l'
  \ }

" " === Ack ===

let g:ackprg = 'ag --vimgrep --ignore-dir=public/uploads --ignore-dir=tmp --ignore-dir=log --ignore-dir=doc --ignore="*.sql"'

" === ALE ===

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" === Altr ===

call altr#define('web/%/%.ex', 'test/%/%_test.exs', 'lib/%/%.ex')
nmap <leader>tt <Plug>(altr-forward)

" === Multiple cursors ===

nnoremap <silent> <C-a> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <C-a> :MultipleCursorsFind <C-R>/<CR>

" === Gitgutter ===

set updatetime=250
let g:gitgutter_map_keys = 0

" === Nerd commenter ===

let g:NERDSpaceDelims = 1

" === deoplete ===

let g:loaded_python_provider = 1
let g:loaded_ruby_provider = 1
let g:python3_host_prog = '/usr/local/bin/python3'
" let g:deoplete#sources._ = ['buffer', 'member', 'tag', 'ultisnips', 'file']
call deoplete#enable()
