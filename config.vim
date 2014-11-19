" Auto carga de plugins
call pathogen#infect('~/.vimcfg/plugins_forked/{}')

" Vim-Airline (Barra de estado molona)
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" CtrlP (abre ficheros en todas partes)
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

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

" esquema de colores
colorscheme molokai

" plugin: taglist (permite ver métodos y atributos de clases, etc)
let Tlist_Show_One_File = 1
let Tlist_WinWidth = 50
let Tlist_Use_SingleClick = 1
let Tlist_Sort_Type = "name"

" configuración de nerdtree
let NERDTreeIgnore = ['\.pyc$']
