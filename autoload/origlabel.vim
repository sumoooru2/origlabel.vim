"=============================================================================
" File: origlabel.vim
" Author: shinji
" Created: 2016-05-02
" License: MIT License
"=============================================================================

scriptencoding utf-8

if !exists('g:loaded_origlabel')
    finish
endif
let g:loaded_origlabel = 1

let s:save_cpo = &cpo
set cpo&vim

function! origlabel#tablabel()
	let label = ''
	let format = g:origLabel#tabLabelFormat
	let mod = g:origLabel#modified
	let nomod = g:origLabel#notModified
	for i in range(tabpagenr('$'))
		let elem = substitute(format, '%mod', getbufvar(tabpagebuflist(i + 1)[0], "&modified") == 1 ? mod : nomod, 'g')
		let elem = substitute(elem, '%num', '' . (i + 1), 'g')
		let elem = substitute(elem, '%name', '%{origlabel#elem(' . (i + 1) . ')}', 'g')
		let elem = (tabpagenr() == i + 1 ? '%#TabLineSel#' : '%#TabLine#') . elem
		let label .= elem
	endfor
	let label .= '%#TabLineFill#%T'
	if exists('g:origLabel#timeFormat')
		let timeFormat = g:origLabel#timeFormat
		let label .= '%=' . strftime(timeFormat)
	endif
	return label
endfunction

function! origlabel#elem(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	"return substitute(substitute(bufname(buflist[winnr - 1]), '/cygdrive/c/Users/shinji', '~', 'g'), '/usr/share/vim/vim74/doc/', '', 'g')
	"return substitute(bufname(buflist[winnr - 1]), '.*/', '', 'g')
	let tabwidth = &columns / tabpagenr('$') - 4
	let fullpath = bufname(buflist[winnr - 1])
	let path = substitute(fullpath, '/usr/.*/vim/vim.*/doc/', 'help/', 'g')
	let path = fnamemodify(path, ':~:.')
	if len(path) > tabwidth
		let path = pathshorten(path)
	endif
	return path[-tabwidth :]
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
