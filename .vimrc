set nocompatible               " be iMproved
filetype off                   " required!

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
" look and feel
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'squarefrog/tomorrow-night.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fugitive.vim'
" some plugins for buffer manipulations
Plug 'jlanzarotta/bufexplorer'
Plug 'The-NERD-tree'
"Plug 'FindInNERDTree'
Plug 'scrooloose/nerdcommenter'
" some usefull plugins
Plug 'itchyny/calendar.vim'
" filetype plugin
"Plug 'erikzaadi/vim-ansible-yaml' "forked
" compleation
"Plug 'SirVer/ultisnips'
Plug 'chase/vim-ansible-yaml' "original repository
"Plug 'honza/vim-snippets'
"Plug 'Valloric/YouCompleteMe'
Plug 'edkolev/tmuxline.vim'
call plug#end()
delc PlugUpgrade " The caveat is that you should *never* use PlugUpgrade

filetype plugin indent on

" ---
" general setup
"

set autoindent
set autoread "reload when changed
set clipboard = "unnamed-plus" "yank and paste with system clipboard
set directory-=. "dont swapfiles in current dir
set ruler
set number
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=4 " show context above/below cursorline
set expandtab "expand tabs to spaces
set shiftwidth=2 " normal mode indentation commands use 2 spaces
set showcmd
set smartcase " case-sensitive search if any caps
set backspace=2
set softtabstop=2 " insert mode tab and backspace use 2 spaces
set tabstop=8 " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu " show a navigable menu for tab completion
set wildmode=longest,list,full
set shm=I
set cursorline
set lazyredraw
set ttyfast
set hlsearch

" ---
" 256 colors
"

set t_Co=256
set t_ut=

" ---
" search
"

set ignorecase
set incsearch

" ---
" airline settings
"

set background=dark
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme="tomorrow"
let g:airline#extension#brach#enable = 1

let NERDTreeShowHidden=1 "always display statusline
set laststatus=2

"---
" keyboard
"

let mapleader = ' '
nmap <leader>d :NERDTreeToggle<CR><CR>
"nmap <leader>f :NERDTreeFind<CR>
nmap <leader>w :w<CR>
nmap <leader>B :BufExplorer
nmap <leader>n :nohlsearch<CR>
inoremap <S-Tab> <C-V><Tab>
"insert tab for makefiles

" ---
" Remap default parametrs
"

noremap <Space> <Nop>
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

colorscheme tomorrow-night "colors

" ---
" autocmd for match file extensions
"
autocmd BufRead,BufNewFile *.md set filetype=markdown
