" Auto carga de plugins
call pathogen#infect('~/.vimcfg/plugins/{}')

" Vim-Airline (Barra de estado molona)
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='badwolf'
" let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace=0

" CtrlP (abre ficheros en todas partes)
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(swp|pyc|py\~)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

" mostrar siempre el número de linea
set number 

" lineas de scroll cuando el cursor deja la pantalla
set scrolljump=5 

" mínimo lineas mantener debajo del cursor
set scrolloff=3 

" marca de columna límite
set colorcolumn=120

" Resaltar linea donde está el curosr
set cursorline

" configuración de tabulación
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype css setlocal ts=4 sts=4 sw=4
autocmd Filetype scss setlocal ts=4 sts=4 sw=4
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype less setlocal ts=4 sts=4 sw=4
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype sh setlocal ts=4 sts=4 sw=4
autocmd Filetype c setlocal ts=4 sts=4 sw=4
autocmd Filetype yaml setlocal ts=4 sts=4 sw=4
autocmd Filetype arduino setlocal ts=4 sts=4 sw=4

" usar espacios para los tabs
set expandtab

" esquema de colores
let g:gruvbox_termcolors = 16
let g:gruvbox_italic=0
colorscheme gruvbox
set background=dark

" plugin: taglist (permite ver métodos y atributos de clases, etc)
let Tlist_Show_One_File = 1
let Tlist_WinWidth = 50
let Tlist_Use_SingleClick = 1
let Tlist_Sort_Type = "name"

" ampliamos número de linea de históricoa
set history=700

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
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let python_highlight_all = 1
let python_version_2 = 1

" colors
hi MatchParen cterm=bold ctermbg=none ctermfg=yellow

" modificar el título del terminal
set title

" asignamos al F2 la función de cambiar entre modo paste
set pastetoggle=<F2>

" emmet
let g:user_emmet_leader_key='<C-x>'

" configuraciones para el modo gui
if has("gui_running")
        set guifont=Droid\ Sans\ Mono\ 11
        set guioptions-=r
        set guioptions-=R
        set guioptions-=l
        set guioptions-=L
        set guioptions-=b
        set guioptions=m
        set guioptions-=T
endif

" cambiamos tecla de leader
let mapleader=","

" configuración search
set incsearch
" set hlsearch

" mejoras para tabs
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

" shell
set shell=bash

" activamos syntax
syntax on

" make backspace work like most other apps
set backspace=2 

" netrw
let g:netrw_list_hide= '.*\.pyc$'

" activamos matchit
set nocompatible
runtime macros/matchit.vim

" cargamos fichero de tags
set tags=tags

" activamos neocompl...
let g:neocomplcache_enable_at_startup = 1
