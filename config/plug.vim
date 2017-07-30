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
Plug 'elixir-lang/vim-elixir'
Plug 'kana/vim-altr'
Plug 'slim-template/vim-slim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'w0rp/ale'
Plug 'diegonogueira/Zenburn'
Plug 'trevordmiller/nova-vim'
" Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
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

" === Vim-test ===

nmap <silent> <leader>tl :TestNearest<CR>
nmap <silent> <leader>tb :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>t. :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let test#filename_modifier = ":~"
let test#strategy = "basic"
" let test#strategy = "iterm"
" let test#strategy = "neovim"
let g:test#preserve_screen = 1

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

" Disable Python 2 support
let g:loaded_python_provider = 1
" Disable Ruby support
let g:loaded_ruby_provider = 1
" Set python3 path
let g:python3_host_prog = '/usr/local/bin/python3'
call deoplete#enable()
let g:deoplete#sources._ = ['buffer', 'member', 'tag', 'neosnippet', 'file']

" === neosnippet ===

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
