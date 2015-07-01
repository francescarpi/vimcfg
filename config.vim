" Auto carga de plugins
call pathogen#infect('~/.vimcfg/plugins/{}')

" Vim-Airline (Barra de estado molona)
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='sol'
let g:airline_powerline_fonts = 1


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
map <C-b> :CtrlPBuffer<CR>
map <C-f> :CtrlPFunky<CR>
map <C-t> :CtrlPTag<CR>

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

au BufRead,BufNewFile *.zsh,*.zsh-theme setfiletype zsh

" parche para mantener el filetype al recargar buffer
" Al arrancar vim, definir: let g:tsp=1.
" Todos los js que se abran, seran del tipo typescript
let g:tsp = 0
fun! PreserveJsFt()
    if g:tsp == 1 " TypeScript Project...
        setfiletype typescript
    endif
endfun
autocmd BufNewFile,BufRead *.js call PreserveJsFt()

" Preservar fyletype para htmldjango
let g:djp = 0
fun! PreserveHtmlFt()
    if g:djp == 1
        setfiletype htmldjango
    endif
endfun
autocmd BufNewFile,BufRead *.html call PreserveHtmlFt()

" esquema de colores
let g:gruvbox_termcolors = 256
let g:gruvbox_italic=0
colorscheme gruvbox
set background=dark

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
" set hlsearch
nnoremap <silent> <F3> :nohlsearch<Bar>:echo<CR>

" shell
set shell=zsh

" activamos syntax
syntax on

" make backspace work like most other apps
set backspace=2 

" netrw
let g:netrw_list_hide= '.*\.pyc$'
set wildmode=longest,list,full

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

" Para no cortar las lineas
set nowrap

" Comandos para Tidy
command Thtml :%!tidy -q -i -w 0 --show-errors 0
command Tjson %!python -m json.tool

