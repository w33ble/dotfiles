" disable default indent rules
"let b:did_indent = 1

" disable indenting on the fly
nnoremap <F8> :setl noai nosi nocin indentexpr= indentkeys=
" enable indenting on the fly
nnoremap <F7> :setl ai si cin indentexpr= indentkeys=0{,0},:,0#,!^F,o,O,e

" modify the indenting
"set expandtab		" insert spaces instead of tabs
set tabstop=2       " use X spaces when tab is pressed
set shiftwidth=2    " shifttabs are also X spaces
