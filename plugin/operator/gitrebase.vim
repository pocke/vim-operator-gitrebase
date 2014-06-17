" Copyright 2014, pocke
" Licensed MIT
" http://opensource.org/licenses/mit-license.php

scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

if exists('g:loaded_operator_gitrebase')
  finish
endif




for s:cmd in ['pick', 'squash', 'edit', 'reword', 'fixup', 'exec']
  let s:operator_name  = 'gitrebase-' . s:cmd
  let s:func_name      = 'operator#gitrebase#' . s:cmd
  call operator#user#define(s:operator_name, s:func_name)
endfor





let g:loaded_operator_gitrebase = 1 

let &cpo = s:save_cpo
unlet s:save_cpo
