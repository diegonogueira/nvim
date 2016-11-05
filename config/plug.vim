call plug#begin()

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy search
Plug 'trevordmiller/nova-vim'                       " nova theme
Plug 'vim-airline/vim-airline'                      " airline
Plug 'tpope/vim-surround'                           " parentheses, brackets, quotes, XML tags, and more
Plug 'Raimondi/delimitMate'                         " auto-completion for quotes, parens, brackets, etc
Plug 'scrooloose/nerdtree'                          " tree navigation
Plug 'scrooloose/nerdcommenter'                     " commenter
Plug 'Lokaltog/vim-easymotion'                      " provides a much simpler way to use some motions in vim
Plug 'godlygeek/tabular'                            " tabulate and alignment
Plug 'terryma/vim-multiple-cursors'                 " Multiple Cursors
Plug 'rizzatti/dash.vim'                            " Dash app
Plug 'michaeljsmith/vim-indent-object'              " Indent selection
Plug 'chaoren/vim-wordmotion'                       " Camel case motion
Plug 'mattn/emmet-vim'                  						" Emmet is a plugin for many popular text editors which greatly improves HTML & CSS workflow:
Plug 'elixir-lang/vim-elixir'                       " Elixir files
Plug 'ekalinin/Dockerfile.vim'                      " Docker file
Plug 'slim-template/vim-slim'                       " vim slim
Plug 'mustache/vim-mustache-handlebars'             " Mustache files
Plug 'lambdatoast/elm.vim'                          " Elm-lang
Plug 'Shougo/neosnippet'                            " neosnippet
Plug 'Shougo/neosnippet-snippets'                   " snippets
Plug 'honza/vim-snippets'                           " snippets
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

source ~/.config/nvim/config/plugins/fzf.vim
source ~/.config/nvim/config/plugins/nerdtree.vim
source ~/.config/nvim/config/plugins/dash.vim
source ~/.config/nvim/config/plugins/vim_wordmotion.vim
source ~/.config/nvim/config/plugins/easymotion.vim
source ~/.config/nvim/config/plugins/deoplete.vim
source ~/.config/nvim/config/plugins/neosnippet.vim
