" set vundle
set rtp+=~/.vimcfg/bundle/Vundle.vim

call vundle#begin()

" common
Plugin 'VundleVim/Vundle.vim'
Plugin 'cohama/lexima.vim'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'Chiel92/vim-autoformat.git'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'reedes/vim-wheel'
Plugin 'vifm/vifm.vim'
Plugin 'maralla/validator.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'tmhedberg/simpylfold'
Plugin 'kien/ctrlp.vim'
Plugin 'posva/vim-vue'

" themes
Plugin 'morhetz/gruvbox'

" html
Plugin 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plugin 'mattn/emmet-vim', { 'for': 'html' }
Plugin 'othree/html5.vim', { 'for': ['html', 'javascript'] }
Plugin 'tpope/vim-haml', { 'for': 'haml'}

" python
Plugin 'hdima/python-syntax.git', { 'for': 'python' }
Plugin 'vim-scripts/indentpython.vim.git', { 'for': 'python' }

" javascript
Plugin 'pangloss/vim-javascript', { 'for': 'javascript' }
Plugin 'mxw/vim-jsx', { 'for': 'javascript' }
Plugin 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plugin 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plugin 'flowtype/vim-flow', { 'for': 'javascript' }

" css
Plugin 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plugin 'groenewege/vim-less.git', { 'for': 'less' }

" mardkdown
Plugin 'plasticboy/vim-markdown.git', { 'for': 'markdown' }
Plugin 'kannokanno/previm', { 'for': 'markdown' }
Plugin 'tyru/open-browser.vim.git', { 'for': 'markdown' }

call vundle#end()

" theme settings
" Font recomended: Source Code Pro for Powerline, Medium, 11
syntax on
syntax enable
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
set background=dark
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_italic=1
colorscheme gruvbox

" gui config
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ 11
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" statusline
set laststatus=2
set statusline=%n:%t%m%<\ %=%#warningmsg#%{validator#get_status_string()}%*\ %y\ %l:%c\ %p%%
au InsertEnter * hi StatusLine ctermfg=142
au InsertLeave * hi StatusLine ctermfg=243

" general settings
set number " show line number
set relativenumber
set colorcolumn=80 " show vertical line at column
set cursorline " show horizontal line at cursor position
set encoding=utf8 " default encoding
set mouse=a " mouse settings
set title " show title in terminal window bar
set pastetoggle=<F2> " key for pastetoggle
"set shell=zsh " default shell
set backspace=indent,eol,start " make backspace behave in a sane manner
set nocompatible
set hidden " current buffer can be put into background
set ttyfast

" Tags
set tags=tags " set tags files
command! MakeTags !ctags -R .
command! MakeTagsES6 !es-ctags -R .

" search settings
set incsearch
set hlsearch
set ignorecase
nnoremap <F3> :noh<CR>
highlight Search guibg=NONE guifg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline

" backups disabled
set nobackup
set nowb
set noswapfile

" default tab settings
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set expandtab
filetype plugin indent on

" file type detection and plugin
filetype on
filetype plugin on

" ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
autocmd FileType * exec 'UltiSnipsAddFiletypes ' . expand('<amatch>')

" python settings
let python_highlight_all = 1

" matchit settings
runtime macros/matchit.vim

" undo
set undofile
set history=700
set undodir=$HOME/.vimundo

" leader key settings
set ttimeout
set ttimeoutlen=0
let mapleader=","

" validator
let g:validator_filetype_map = {"python.django": "python", "javascript.jsx": "javascript"}
let g:validator_javascript_checkers = ['eslint']
let g:validator_python_checkers = ['flake8']
let g:validator_error_msg_format = "[ ● %d/%d issues ]"
let g:validator_permament_sign = 1

" lesstocss settings
let g:lesscss_on = 0

" netrw settings
set wildmenu
set wildignore+=*.pyc
let g:netrw_banner=0 " disable annoying banner
let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1 " open splits to the right
let g:netrw_liststyle=3 " tree view
let g:netrw_list_hide= '.*\.pyc$'
"
" find files
set path+=**

" jsx settings
let g:jsx_ext_required = 0

" generic shortcuts
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
imap jj <Esc>

" folding
set foldenable
set foldmethod=syntax
nnoremap <space> za
set nofoldenable

" vifm
map <leader>f :EditVifm<CR>

" utils
map <F6> :%!python -m json.tool<CR>

" emmet
let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
autocmd FileType html,css,javascript.jsx EmmetInstall

" syntax fix
autocmd BufEnter * :syntax sync fromstart

" buffer remaps
nnoremap <C-Tab> :bn<CR>
