nnoremap <silent> ,t :Files<CR>
nnoremap <silent> ,b :Buffers<CR>
nnoremap ,g :GGrep<Space>
nnoremap ,, :Buffers<CR><CR>

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
