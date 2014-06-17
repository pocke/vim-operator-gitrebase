" Copyright 2014, pocke
" Licensed MIT
" http://opensource.org/licenses/mit-license.php

scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim





function! s:change_keyword(keyword, start, end)
  execute a:start . ',' . a:end . 's/^\v<\S+>/' . a:keyword . '/ge'
endfunction


for s:cmd in ['pick', 'squash', 'edit', 'reword', 'fixup', 'exec']
  let s:func_name = 'operator#gitrebase#' . s:cmd
  execute
    \ 'function! ' . s:func_name . '(motion_wise)'              "\n"
    \   'let start_l = line("''[")'                             "\n"
    \   'let end_l   = line("'']")'                             "\n"
    \   'call s:change_keyword("' . s:cmd .'", start_l, end_l)' "\n"
    \ 'endfunction'
endfor



let &cpo = s:save_cpo
unlet s:save_cpo
