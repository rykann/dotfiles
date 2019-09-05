set background=dark
colorscheme solarized
set guifont=Menlo:h14
set nowrap

let mapleader = ","

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
autocmd FileType yaml setlocal ts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sw=2 expandtab
autocmd FileType scss setlocal ts=2 sw=2 expandtab
autocmd FileType handlebars setlocal ts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sw=4 expandtab

autocmd BufNewFile,BufRead Capfile set syntax=ruby

" folding
set foldenable
set foldlevelstart=10 " 10 layers open by default
set foldnestmax=10
set foldmethod=syntax
set foldlevel=1
" folding toggle
nnoremap <space> za

" allow backspacing over more things in insert mode
set backspace=indent,eol,start

"rspec.vim mappings
autocmd FileType ruby map <leader>r :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <leader>l :call RunNearestSpec()<CR>

"rspec.vim command
let g:rspec_command = "!bundle exec rspec {spec}"

"strip trailing whitespace on save for certain file types
"(add more file types separated by commas)
autocmd FileType ruby,javascript,python autocmd BufWritePre <buffer> :%s/\s\+$//e

"alt-ruby.vim mappings
nnoremap <leader>at :AlternateToggle<cr>
nnoremap <leader>av :AlternateVerticalSplit<cr>
nnoremap <leader>as :AlternateHorizontalSplit<cr>

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

"easier window width adjustment
nnoremap > 5<C-w>>
nnoremap < 5<C-w><

"suppress warnings about unsaved changes in hidden buffers
set hidden

"show ruler by default
set ruler

" copy buffer to clipboard
map <leader>ya :%y+<CR>

" switch to previous buffer
map <leader><leader> <C-^>

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>c :!ctags -R<CR>

"toggle paste mode
set pastetoggle=<F2>

"put swap files in ~/.vim/swap
set backupdir=~/.vim/swap
set directory=~/.vim/swap

"disable swap files
set noswapfile

"enable matchit plugin (needed for ruby-matchit to work)
runtime macros/matchit.vim

"use jk to get out of insert mode
inoremap jk <esc>
inoremap kj <esc>

"edit and source vimrc and gvimrc mappings
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"copy path of current file to clipboard
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>

"use old regex engine (due to lagginess editing Ruby files)
"set re=1

set clipboard=unnamed

"ctrlp (https://github.com/kien/ctrlp.vim)
let g:ctrlp_custom_ignore = '\v(bower_components|node_modules|dist|tmp|\.git)$'

"hit F5 to toggle bewteen solarized dark and light colorschemes
call togglebg#map("<F5>")

"autosave
autocmd FocusLost,BufLeave,TextChanged,TextChangedI * silent wall
