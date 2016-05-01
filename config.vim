" Set Vundle
set rtp+=~/.vimcfg/bundle/Vundle.vim

call vundle#begin()

" common
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'tacahiroy/ctrlp-funky.git'
Plugin 'rbgrouleff/bclose.vim.git'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'scrooloose/syntastic.git'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'mbbill/undotree.git'
Plugin 'vim-airline/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes.git'
Plugin 'Chiel92/vim-autoformat.git'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'Yggdroot/indentLine.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'rking/ag.vim', { 'on': 'Ag' }
Plugin 'tpope/vim-fugitive'

" themes
Plugin 'morhetz/gruvbox.git'

" html
Plugin 'mattn/emmet-vim.git', { 'for': ['html', 'javascript'] }

" python
Plugin 'hdima/python-syntax.git', { 'for': 'python' }
Plugin 'vim-scripts/indentpython.vim.git', { 'for': 'python' }

" javascript
Plugin 'pangloss/vim-javascript.git', { 'for': ['html', 'javascript'] }
Plugin 'mxw/vim-jsx.git', { 'for': ['javascript.jsx', 'javascript'] }

" css
Plugin 'groenewege/vim-less.git', { 'for': ['less'] }
Plugin 'vitalk/vim-lesscss.git', { 'for': ['less'] }

" mardkdown
Plugin 'plasticboy/vim-markdown.git', { 'for': ['markdown'] }

call vundle#end()

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

" CtrlP (abre ficheros en todas partes)
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(swp|pyc|py\~)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_matchtype = 'line'
let g:ctrlp_funky_syntax_highlight = 1
map <C-f> :CtrlPFunky<CR>
map <C-t> :CtrlPTag<CR>
map <C-b> :CtrlPBuffer<CR>

" mostrar siempre el número de linea
set number 

" lineas de scroll cuando el cursor deja la pantalla
set scrolljump=5 

" mínimo lineas mantener debajo del cursor
set scrolloff=3 

" marca de columna límite
set colorcolumn=80

" Resaltar linea donde está el curosr
set cursorline

" configuración de tabulación
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript.jsx setlocal ts=2 sts=2 sw=2
autocmd Filetype less setlocal ts=2 sts=2 sw=2

au BufRead,BufNewFile *.zsh,*.zsh-theme setfiletype zsh

" Preservar fyletype para htmldjango
let g:djp = 0
fun! PreserveHtmlFt()
    if g:djp == 1
        setfiletype htmldjango
    endif
endfun
autocmd BufNewFile,BufRead *.html call PreserveHtmlFt()

" Preservar fyletype para javascript.jsx
let g:rp = 0
fun! PreserveJsxFt()
    if g:rp == 1
        setfiletype javascript.jsx
    endif
endfun
autocmd BufNewFile,BufRead *.js call PreserveJsxFt()

" activamos syntax
syntax on
syntax enable

" esquema de colores
set background=dark
colorscheme gruvbox
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_dark='hard' " hard, medium, soft

" recargar un fichero cuando cambia
set autoread

" habilita la detección de tipo de fichero
filetype on

" habilita plugins específicos para tipos de ficheros
filetype plugin on

" manejo automático de sangría para python
filetype plugin indent on

" mejoras en autocompletado
set wildmenu

" ignora case cuando se busca
set ignorecase

" codificación por defecto
set encoding=utf8

" activación del uso del mouse en el terminal
set mouse=a

" desactivamos backups, swaps...
set nobackup
set nowb
set noswapfile

" plugin para snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let python_highlight_all = 1
let python_version_2 = 1

" modificar el título del terminal
set title

" asignamos al F2 la función de cambiar entre modo paste
set pastetoggle=<F2>
 
" emmet
let g:user_emmet_leader_key='<C-x>'

" configuración search
set incsearch
set nohlsearch
nnoremap <silent> <F5> :nohlsearch<Bar>:echo<CR>

" shell
set shell=zsh

" make backspace work like most other apps
set backspace=2 

" netrw
let g:netrw_list_hide= '.*\.pyc$'
set wildmode=longest,list,full
nnoremap <silent> <F3> :e %:h<CR>

" activamos matchit
set nocompatible
runtime macros/matchit.vim

" cargamos fichero de tags
set tags=tags

" Undo
set undofile
set history=700
set undodir=$HOME/.vimundo
nnoremap <F4> :UndotreeToggle<cr>

" Desactivamos timeout de la tecla leader
set ttimeout
set ttimeoutlen=0
let mapleader=","

" Syntastic
let g:syntastic_html_checkers=['']
let g:syntastic_less_checkers=['']
let g:syntastic_css_checkers=['']
let g:syntastic_javascript_checkers=['']
" let g:syntastic_javascript_checkers = ['eslint']

" Teclas per anar al principi o final de la linea en modo insert
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

" remove horizontal cursor line
set cul!

" show slashes in json files
set conceallevel=0

" shortcut for escape...
imap jj <Esc>

" Buffergator
let g:buffergator_viewport_split_policy = "B"

" less to css
let g:lesscss_on = 0

"Open NERDTree with Ctrl-n
map <F5> :NERDTreeToggle<CR>
