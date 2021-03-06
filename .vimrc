set matchpairs+=<:>
"===================Vundle================"
    set nocompatible              " be iMproved, required
    filetype off                  " required
    if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin()
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'dense-analysis/ale'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'VundleVim/Vundle.vim'
"    Plug 'othree/yajs.vim'
"    Plug 'yuezk/vim-js'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'flazz/vim-colorschemes'
    Plug 'leafgarland/typescript-vim'
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
  call plug#end()

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  " :PluginInstall

  

  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on
  "
  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
  "
  " see :h vundle for more details or wiki for FAQ

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'jsformatter'
  let g:airline_powerline_fonts = 1
"    let g:airline_theme = 'base16color'
  let g:airline_theme = 'base16_snazzy'
"============Swap File Directory==========="
set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif
"===============File Types ================"
autocmd BufNewFile,BufRead *.jsx set syntax=javascript
"===============Block Cursor==============="
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
"================File Search==============="
set path+=**
set wildignore+=**/node_modules/**
set wildignore+=**/downloads/**
set wildignore+=**/wp-content/uploads/**
"================Spaces and Tabs==========="
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
"===========Indentation Features==========="
" see backspace=indent,eol,start
"  set autoindent
"  set smartindent
"==================   Theme    ============"
set t_Co=256
colorscheme molokai
set background=dark
syntax on
"==================UI Config==============="
set number
set showcmd
set cursorline
filetype indent on
set showmatch
set laststatus=2
"==================Searching================"
set incsearch
set hlsearch
:hi Search ctermbg=3 ctermfg=8
set wildmenu
set wildmode=list:longest,full
"==================Movement================="
set ttyfast
nnoremap B ^
nnoremap E $
set backspace=indent,eol,start
nnoremap <C-L> <C-W><C-L>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
"================Syntastic================="
"   set statusline+=%#warningmsg#
"   set statusline+=%{SyntasticStatuslineFlag()}
"   set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"===================Syntastic=============="
let g:syntastic_java_checker = ['javac']
"==============Leader Shortcuts============="
let mapleader=" "
nnoremap <leader>nn :noh<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>s :update<CR>
nnoremap <leader><leader> :find 
nnoremap <leader>bd :bd!<CR>
nnoremap <leader>fp zf}
nnoremap <leader>fe $zf%
nnoremap <leader>fb ($zf%
nnoremap <leader>un :set ff=unix<CR> 
nnoremap <leader>win :%s/^M//g<CR>
"====================NERDTree=============="
nnoremap <leader>d :NERDTree<CR>
nnoremap <leader>ag :Ag<CR>
nnoremap <leader>ff :Files<CR>
"    let g:NERDTreeDirArrowExpandable="+"
"    let g:NERDTreeDirArrowCollapsible="~"
"====================ESLint================"
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
"====================Powerline============="
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
"==============Code Completion============="
set complete=.,b,u,]
set completeopt=menu,preview
"===============Miscellanious=============="
map <F4> :execute "vimgrep /" . expand("<cword>") . "/gj **" <Bar> cw <CR>
" Always show statusline
set laststatus=2
" set termguicolors
" Turn off background bleeding when jumping to top/bottom
" if &term =~ '256color'
"  set t_ut=
" endif
set matchpairs+=<:>
"============== Vim folds =============="
au BufWinLeave * mkview
au BufWinEnter * silent loadview
