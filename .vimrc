" An example for a vimrc file.
"
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
  " set hlsearch
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

"============="
" My Settings "
"============="

"" Mouse support
set mouse=a
set ttymouse=xterm2

"" System clipboard
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

"" Matching parentheses etc.
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i

"" Set backup and undo directory
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

"" Set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

"" Toggle line numbers and relative line numbers
function! s:toggle_number()
  set number! relativenumber! relativenumber?
  if &number
    augroup relnumtoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END   
  else
    augroup relnumtoggle
      autocmd!
    augroup END
  endif
endfunction

noremap <silent> <F3> :call <SID>toggle_number()<CR>

"" Toggle highlighting and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

"" Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Syntax
Plug 'https://github.com/sheerun/vim-polyglot.git'
" Status line
Plug 'itchyny/lightline.vim'
" Color schemes 
Plug 'dikiaap/minimalist'
Plug 'joshdick/onedark.vim'
Plug 'dylanaraps/wal.vim'
" Parentheses control
Plug 'tpope/vim-surround'
call plug#end()

"" Syntax and color scheme 
syntax on
colorscheme wal
" Odd files syntax highlight
autocmd BufRead,BufNewFile compton.conf setf dosini
autocmd BufRead,BufNewFile *.rasi setf css
" Override line number color
highlight LineNr ctermfg=238 guifg=#4b5263

"" Change terminal margin when entering Vim
autocmd VimEnter * :silent exec "!konsoleprofile terminalMargin=70"
autocmd VimLeave * :silent exec "!konsoleprofile terminalMargin=16"

"" Show status line 
set laststatus=2
set noshowmode

