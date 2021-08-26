" Showing matches
set showmatch

" Add syntax higlithing
syntax enable

" File type detection
filetype plugin on
filetype plugin indent on

" Enable mouse
if has('mouse')
	set mouse=a
endif

" Show incomplete command
set showcmd

" backspace config
set backspace=indent,eol,start

" Set nocompatible
set nocompatible

" line number
set number

" display cursor position
set ruler

" color in search
set hlsearch

" Autocomple search
set incsearch

" Vimplug autoinstall
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins install
call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/vim-unified-diff'
Plug 'codota/tabnine-vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-unimpaired'

call plug#end()

"Save lost focus
:au FocusLost * :wa

" Textwidth 
set textwidth=72

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Nerd tree help command
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Fzf map
nnoremap <C-p> :<C-u>Files<CR>
