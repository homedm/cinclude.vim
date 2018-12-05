"=============================================================================
" File: cinclude.vim
" Author: jj1hgp
" Created: 2018-12-03
"=============================================================================

scriptencoding utf-8

if !exists('g:loaded_cinclude')
    finish
endif
let g:loaded_cinclude = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists('cinclude_last_line')
    let g:cinclude_last_line = 50
endif

if !exists('cinclude_start_line')
    let g:cinclude_start_line = 0
endif

"=============================================================================
" function
" add include sentence
"=============================================================================
function! s:get_last_line() abort
    let l:last = line("$")
    if g:cinclude_last_line <= l:last
        return g:cinclude_last_line
    endif
    return l:last
endfunction

function! s:get_start_line() abort
    let l:start = 0
    if g:cinclude_start_line >= l:start
        return g:cinclude_start_line
    endif
    return l:start
endfunction

function! cinclude#add_include_sentence(headfile) abort
    " headfileが書かれているかをチェックする
    let l:pattern = '^#include\s*<\s*'.a:headfile.'\.h\s*>'
    let l:i = s:get_start_line()
    let l:last = s:get_last_line()
    let endIncline = l:i
    while l:i < l:last
        let curline =  getline(l:i)
        if curline =~ '^#include\s*<\s*'
            let endIncline = l:i
            if curline =~ pattern
                " 引数のライブラリがincludeされていれば、中止
                return
            endif
        endif
        let l:i += 1
    endwhile
    let l:i -= 1

    " headfileがまだインクルードされていなければ、追加する。
    let insert = '#include<'.a:headfile.'.h>'
    call append(endIncline, insert)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
