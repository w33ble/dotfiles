" disable indenting on the fly
nnoremap <F8> :setl indentexpr= indentkeys=
" enable indenting on the fly
nnoremap <F7> :setl indentexpr=GetPhpIndent() indentkeys=0{,0},0),:,!^F,o,O,e,*<Return>,=?>,=<?,=*/

" Folding
"let php_folding=1
let g:DisableAutoPHPFolding = 1
