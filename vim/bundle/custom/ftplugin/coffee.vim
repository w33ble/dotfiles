" modify the indenting
set expandtab      " insert spaces instead of tabs
set tabstop=2       " use X spaces when tab is pressed
set shiftwidth=2    " shifttabs are also X spaces

" vim-coffee-sript settings
" TODO: add check for vim-coffee-script
vmap <leader>v <esc>:'<,'>:CoffeeCompile vert<CR>
map <leader>v :CoffeeCompile vert<CR>
map <leader>c :silent CoffeeMake <CR>
