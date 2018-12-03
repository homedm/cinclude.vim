"=============================================================================
" File: cinclude.vim
" Author: jj1hgp
" Created: 2018-12-03
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_cinclude')
    finish
endif
let g:loaded_cinclude = 1

let s:save_cpo = &cpo
set cpo&vim

" Add include sentence Command
command! -nargs=? CInclude call cinclude#add_include_sentence(<f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
