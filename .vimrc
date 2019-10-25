execute pathogen#infect()
map <F4> :execute "vimgrep /" . expand("<cword>") . "/gj **" <Bar> cw <CR>
set matchpairs+=<:>
" Allow for file search from within working directory
set path+=**
map <Space> :noh<cr>
" Line Number
set number
" Tab Width
set tabstop=2
" Tabs -> Spaces
set expandtab
" Auto-indent new lines
set autoindent
" Auto indent with 2 spaces
set shiftwidth=2
" One tab -> 2 spaces
set softtabstop=2
" Enable smart-indent
set smartindent
colorscheme OceanicNext
syntax match div "//" conceal cchar=÷
syntax match mul "*" conceal cchar=×
syntax match eq "==" conceal cchar=≣
syntax match neq "!=" conceal cchar=≠
syntax match gteq ">=" conceal cchar=≥
syntax match lteq "<=" conceal cchar=≤
" Turn off background bleeding when jumping to top/bottom
if &term =~ '256color'
  set t_ut=
endif


" Sane Defaults
"
" An example for a vimrc file.
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif