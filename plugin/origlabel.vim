"=============================================================================
" File: origlabel.vim
" Author: shinji
" Created: 2016-05-02
" License: MIT License
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_origlabel')
    finish
endif
let g:loaded_origlabel = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=0 OrigLabel set tabline=%!origlabel#tablabel()

let &cpo = s:save_cpo
unlet s:save_cpo
