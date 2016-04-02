set number
set expandtab
set tabstop=2
set shiftwidth=2 
set autoindent
set t_Co=256
syntax enable
colorscheme slate
au BufNewFile,BufRead *.wl setlocal ft=mma
au BufNewFile,BufRead *.m setlocal ft=mma
au BufNewFile,BufRead *.ino setlocal ft=c
