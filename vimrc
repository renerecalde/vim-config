" Map leader
let mapleader = ","
" Vimplug autoinstall
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins install

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'             "| Optional
Plug 'tpope/vim-projectionist'        "|
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-surround'
Plug 'lambdalisue/vim-unified-diff'
Plug 'codota/tabnine-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/php-annotations-syntax'
Plug 'sniphpets/sniphpets-symfony'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'
Plug 'noahfrederick/vim-laravel'
Plug 'noahfrederick/vim-composer'     "|
Plug 'noahfrederick/vim-laravel'
Plug 'StanAngeloff/php.vim'
Plug 'xsbeats/vim-blade'
Plug 'borissov/vim-mysql-suggestions'
Plug 'kkvh/vim-docker-tools'
Plug 'ekalinin/dockerfile.vim'
Plug 'mattn/emmet-vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'sainnhe/everforest'
Plug 'sgur/vim-editorconfig'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'nelsyeung/twig.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'vim-scripts/SQLComplete.vim'
Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'
Plug 'arcticicestudio/nord-vim'
Plug 'chr4/nginx.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'morhetz/gruvbox'
Plug 'valloric/youcompleteme'
Plug 'junegunn/vim-easy-align'
Plug 'baghdad-theme/baghdad.vim'

call plug#end()

"  For fzf previews
set termguicolors

" tabs are at proper location
set tabstop=8

" softtabstop
set softtabstop=8

" indenting is 4 spaces
set shiftwidth=8

" expand tab
set noexpandtab

" activate the previous two
set autoindent

" To stop indenting when pasting with the mouse
set pastetoggle=<f5>

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

"Save lost focus
:au FocusLost * :wa

" Textwidth 
set textwidth=120



"Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Nerd tree help command
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Fzf map
nnoremap <C-p> :<C-u>Files<CR>

"PHP complete_extended
"autocmd  FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
"let g:phpcomplete_index_composer_command="composer"

function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
hi phpUseNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
hi phpClassNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
syn match phpParentOnly "[()]" contained containedin=phpParent
hi phpParentOnly guifg=#f08080 guibg=NONE gui=NONE

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Omincomplete
highlight Pmenu ctermbg=238 gui=bold
set completeopt-=preview
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['datetime', 'javascript']

" Define pairs of Blade directives. This variable is used for highlighting and indentation.
let g:blade_custom_directives_pairs = {
      \   'markdown': 'endmarkdown',
      \   'cache': 'endcache',
      \ }


" emmet config
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall

" file format
".vimrc
map <c-g> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-g> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-g> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-g> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-g> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-g> :call CSSBeautify()<cr>

" Forest theme
if has('termguicolors')
  set termguicolors
endif
" For dark version.
set background=dark
" For light version.
" set background=light
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
" let g:everforest_background = 'soft'
" colorscheme everforest
" colorscheme nord
" colorscheme gruvbox
colorscheme baghdad

" let g:airline_theme = 'base16_nord'
let g:airline_theme = 'dark'
"let g:airline_theme = 'gruvbox'
"let g:everforest_diagnostic_line_highlight = 1

"Editor config
let g:editorconfig_blacklist = {
    \ 'filetype': ['git.*', 'fugitive'],
    \ 'pattern': ['\.un~$']}

" Add class
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

" Config vim-dadbot-ui database
let g:db_ui_env_variable_url = 'DATABASE_URL'
let g:db_ui_env_variable_name = 'DATABASE_NAME'

" Syntastic config

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Ale config
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

"Python identation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" Quit withespaces
autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

