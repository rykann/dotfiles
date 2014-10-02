colorscheme codeschool
set guifont=Menlo:h14
set guioptions-=T "hide toolbar in MacVim

"pathogen automatically loads plugins under ~/.vim/bundle
"https://github.com/tpope/vim-pathogen
call pathogen#infect()

syntax on
filetype plugin indent on

autocmd FileType ruby setlocal ts=2 sw=2 expandtab
autocmd FileType java setlocal ts=4 sw=4 expandtab
autocmd FileType html setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sw=2 expandtab
autocmd FileType coffee setlocal ts=2 sw=2 expandtab
autocmd FileType cucumber setlocal ts=2 sw=2 expandtab
autocmd FileType sh setlocal ts=2 sw=2 expandtab

"CoffeeScript key mappings
autocmd FileType coffee map <buffer> <leader>r :CoffeeRun<CR>
autocmd FileType coffee map <buffer> <leader>m :CoffeeCompile 15<CR>

"strip trailing whitespace on save for certain file types
"(add more file types separated by commas)
autocmd FileType ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

let mapleader = ","

"line numbers
set number

"incremental search
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <leader><space> :noh<cr>:<esc>

"global search/replace by default
set gdefault

"flash matching bracket on insert
set showmatch

"highlight the cursor's line
set cursorline

"highlight the cursor's column
set cursorcolumn

"display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

"easier window-switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"suppress warnings about unsaved changes in hidden buffers
set hidden

"show ruler by default
set ruler

" copy buffer to clipboard
map <leader>a :%y+<CR>

map <F3> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nnoremap <F4> :buffers<CR>:buffer<Space>
"nnoremap <D-r> :CoffeeRun<CR>

"key mappings for alt-ruby.vim
nnoremap <leader>at :AlternateToggle<cr>
nnoremap <leader>av :AlternateVerticalSplit<cr>
nnoremap <leader>as :AlternateHorizontalSplit<cr>

"put swap files in ~/.vim/swap
set backupdir=~/.vim/swap
set directory=~/.vim/swap

"enable matchit plugin (needed for ruby-matchit to work)
runtime macros/matchit.vim

"use jk to get out of insert mode
inoremap jk <esc>

"edit and source vimrc and gvimrc mappings
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"copy path of current file to clipboard
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
