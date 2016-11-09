" Disable Python 2 support
let g:loaded_python_provider = 1

" Disable Ruby support
let g:loaded_ruby_provider = 1

" Set python3 path
let g:python3_host_prog = '/usr/local/bin/python3'

call deoplete#enable()

let g:deoplete#sources._ = ['buffer', 'member', 'tag', 'neosnippet', 'file']
