" Auto carga de plugins
call pathogen#infect('~/.vimcfg/plugins/{}')

" Vim-Airline (Barra de estado molona)
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace=0

" funcionalidad para saltar al último tab y alternar
let g:lasttab = 1
nmap gl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" CtrlP (abre ficheros en todas partes)
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee\^\.pyc\^.hg\'
map <C-b> :CtrlP<cr>
let g:ctrlp_extensions = ['funky']

" mostrar siempre el número de linea
set number 

" lineas de scroll cuando el cursor deja la pantalla
set scrolljump=5 

" mínimo lineas mantener debajo del cursor
set scrolloff=3 

" marca de columna límite
set colorcolumn=80 

" permite identar en modo visual, sin salir de él
vnoremap < <gv
vnoremap > >gv 

" Resaltar linea donde está el curosr
set cursorline

" configuración de tabulación
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype less setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4

" usar espacios para los tabs
set expandtab

" esquema de colores
colorscheme molokai

" plugin: taglist (permite ver métodos y atributos de clases, etc)
let Tlist_Show_One_File = 1
let Tlist_WinWidth = 50
let Tlist_Use_SingleClick = 1
let Tlist_Sort_Type = "name"

" configuración de nerdtree
let NERDTreeIgnore = ['\.pyc$']

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
if has('mouse')
  set mouse=a
endif

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
