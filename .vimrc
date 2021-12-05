"  For fzf previews
set termguicolors

" Set tags
set tags=./tags,tags;$HOME

" tabs are at proper location
set tabstop=8

" indenting is 4 spaces
set shiftwidth=4

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/php-annotations-syntax'
Plug 'sniphpets/sniphpets-symfony'
Plug 'rykka/riv.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'
Plug 'm2mdas/phpcomplete-extended'
Plug 'm2mdas/phpcomplete-extended-laravel'
Plug 'noahfrederick/vim-laravel'
Plug 'tpope/vim-dispatch'             "| Optional
Plug 'tpope/vim-projectionist'        "|
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
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'tpope/vim-dotenv'
Plug 'dense-analysis/ale'

call plug#end()

"Save lost focus
:au FocusLost * :wa

" Textwidth 
set textwidth=120

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Nerd tree help command
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Fzf map
nnoremap <C-p> :<C-u>Files<CR>

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
"set background=light
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'soft'
colorscheme everforest
let g:airline_theme = 'everforest'
let g:everforest_diagnostic_line_highlight = 1

" Editor config
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

" Dadbod config
let g:db_ui_env_variable_url = 'DATABASE_URL'
let g:db_ui_env_variable_name = 'DATABASE_NAME'
