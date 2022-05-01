syntax on
filetype plugin on

set nocompatible
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
" convert tabs to spaces
set expandtab
set smartindent
set nu
set nowrap
" case sensitive searching
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColoumn ctermbg=0 guibg=lightgrey
"set termguicolors

call plug#begin('~/.vim/plugged')
" installing plugins
"Plug 'https://github.com/markabe/vim-txt.git'
" greatest color scheme
"Plug 'morhetz/gruvbox'
"Plug 'arcticicestudio/nord-vim'
"Plug 'git@github.com:tpope/vim-surround.git'
Plug 'cocopon/iceberg.vim'
Plug 'vimwiki/vimwiki'
Plug 'https://github.com/arcticicestudio/nord-vim.git'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" very fast grep
"Plug 'jremmen/vim-ripgrep'
" logs, etc
"Plug 'tpope/vim-fugitive'
" specifically for typescript
" Plug 'leafgarland/typescript-vim'
"Plug 'vim-utils/vim-man'
" great for C++
"Plug 'lyuts/vim-rtags'
" for file finding
"Plug 'https://github.com/kien/ctrlp.vim.git'
" for autocompleting
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'mbbill/undotree'
Plug 'altercation/vim-colors-solarized'
call plug#end()
let g:airline#extensions#tabline#enabled = 1



"let g:gruvbox_contrast_dark='medium'

set background=light
colorscheme PaperColor

if executable('rg')
    let g:rg_derive_roots='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0

" ag is fast enough that ctrlP doesn't need to cache "
let g:ctrlp_use_caching = 0
let g:netrw_winsize = 25

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 25<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +10<CR>
nnoremap <silent> <leader>- :vertical resize -10<CR>

" YCM best part
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

nnoremap <C-a> :!g++ -o  %:r.out % -std=c++11;./%:r.out<Enter>

nnoremap <C-c> :!var="-----------------------------------------------";echo $var;g++ -o  %:r.out % -std=c++11<Enter>
nnoremap <C-x> :!var="-----------------------------------------------";echo $var;./%:r.out<Enter>
autocmd vimEnter *.cpp map <F8> :w <CR> :!clear ; g++ --std=c++11 -Wall -Wextra -Wno-unused-result -static %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>
nnoremap <leader>t <C-w><C-o>:terminal cftest.sh %<CR>
nnoremap <leader>T <C-w><C-o>:terminal cftest.sh % --sanitize<CR>
"map <leader>r :!chmod +x % && ./%<CR>
"map <leader>r :!chmod +x % && ./%<CR>
"map<leader>r :w<CR> :!gcc % -o %<.x -Wall -Wextra 2>errors.err; cat errors.err<CR>

"!gcc % -o %< && ./%< <CR>

"g++ -Wall -g -std=c++17 test.cpp -o test
