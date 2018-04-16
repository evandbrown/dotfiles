set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/plugged')
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdTree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-buftabline'
Plug 'zchee/deoplete-go'
Plug 'Shougo/deoplete.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'roxma/vim-tmux-clipboard'
call plug#end()

filetype plugin indent on    " required

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.
set shortmess+=O

" Color
set background=light
colorscheme nofrils-light

" Setting shell for vim
set shell=bash
set mouse=a
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Handle splits more naturally
set splitbelow
set splitright

" Syntax Completion
filetype plugin on
set ofu=syntaxcomplete#Complete

" deoplete
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/usr/bin/python3'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let mapleader=","

" backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

set expandtab                    " Use spaces instead of tabs
set tabstop=4
set shiftwidth=2
set softtabstop=4
set autoindent

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Enable syntax, but not for yml files
au BufNewFile,BufRead * if expand('<afile>:e') !=? 'yml' | syntax enable | endif

" Color Scheme
set t_Co=256

map <leader>t :TagbarToggle<cr>
map <leader>n :NERDTreeToggle<cr>
map <leader>g :Git<Space>
map <leader>c :CtrlPClearAllCaches<cr>
map <leader>/ :Ack<Space>
map <leader>d :bp\|bd # <cr>

" Quickfix
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" bind L to grep word under cursor
map <F4> :execute "grep -F " . expand("<cword>") . " **/*" <Bar> cw<CR>

" Removing search highlighting
nnoremap <ESC><ESC> :nohlsearch<CR>

" split naviagation
map <leader>- :split<CR>
map <leader><bar> :vsplit<CR>
noremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ctrlp
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Switch between buffers
nnoremap <C-n> :bnext<cr>
nnoremap <C-m> :bprevious<cr>

" disable arrow keys
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

au FileType go nmap <leader>gd <Plug>(go-def)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>f <Plug>(go-fmt)

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
