" set vundle
set rtp+=~/.vimcfg/bundle/Vundle.vim

call vundle#begin()

" common
Plugin 'VundleVim/Vundle.vim'
Plugin 'Raimondi/delimitMate.git'
Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'tacahiroy/ctrlp-funky.git'
Plugin 'rbgrouleff/bclose.vim.git'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'scrooloose/syntastic.git', {'for': ['python', 'javascript']}
Plugin 'tomtom/tcomment_vim.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'mbbill/undotree.git'
Plugin 'Chiel92/vim-autoformat.git'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'Yggdroot/indentLine.git'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'reedes/vim-wheel'
Plugin 'vifm/vifm.vim'

" themes
Plugin 'morhetz/gruvbox'

" html
Plugin 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plugin 'mattn/emmet-vim', { 'for': ['html', 'javascript'] }
Plugin 'othree/html5.vim', { 'for': ['html', 'javascript'] }
Plugin 'tpope/vim-haml', { 'for': 'haml'}

" python
Plugin 'hdima/python-syntax.git', { 'for': 'python' }
Plugin 'vim-scripts/indentpython.vim.git', { 'for': 'python' }

" javascript
Plugin 'othree/yajs.vim', { 'for': 'javascript' }
Plugin 'maksimr/vim-jsbeautify', { 'for': 'javascript' }
Plugin 'wizicer/vim-jison', { 'for': 'jison' }
Plugin 'mxw/vim-jsx', { 'for': 'javascript' }
Plugin 'pangloss/vim-javascript.git', { 'for': ['html', 'javascript'] }

" css
Plugin 'groenewege/vim-less.git', { 'for': ['less'] }
Plugin 'vitalk/vim-lesscss.git', { 'for': ['less'] }

" mardkdown
Plugin 'plasticboy/vim-markdown.git', { 'for': ['markdown'] }
Plugin 'kannokanno/previm'
Plugin 'tyru/open-browser.vim.git'

call vundle#end()

" theme settings
syntax on
syntax enable
set background=dark
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_dark='hard'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme gruvbox

" statusline
set statusline=%f%m%<\ %=%#warningmsg#%{SyntasticStatuslineFlag()}%*\ %y\ %l\ %p%%
set laststatus=2

" ctrlp settings
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
map <C-b> :CtrlPBuffer<CR>

" general settings
set number " show line number
set colorcolumn=80 " show vertical line at column
" set cursorline " show horizontal line at cursor position
set wildmenu " enhanced command line completion
set encoding=utf8 " default encoding
set mouse=a " mouse settings
set title " show title in terminal window bar
set pastetoggle=<F2> " key for pastetoggle
set shell=zsh " default shell
set backspace=indent,eol,start " make backspace behave in a sane manner
set tags=tags " set tags files
set nocompatible
set hidden " current buffer can be put into background

" search settings
set incsearch
set nohlsearch
set ignorecase

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
" UltiSnips filetype automatic
autocmd FileType * exec 'UltiSnipsAddFiletypes ' . expand('<amatch>')

" python settings
let python_highlight_all = 1
let python_version_2 = 1

" emmet settings
let g:user_emmet_leader_key='<C-x>'

" matchit settings
runtime macros/matchit.vim

" undo and undotree settings
set undofile
set history=700
set undodir=$HOME/.vimundo
nnoremap <F4> :UndotreeToggle<cr>

" leader key settings
set ttimeout
set ttimeoutlen=0
let mapleader=","

" syntastic settings
" https://github.com/jaxbot/syntastic-react
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
map <F5> :SyntasticCheck<CR>

" buffergator settings
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "basename"
let g:buffergator_show_full_directory_path = 0

" lesstocss settings
let g:lesscss_on = 0

" netrw settings
let g:netrw_list_hide= '.*\.pyc$'
set wildmode=longest,list,full
nnoremap <silent> <F3> :e %:h<CR>

" react settings
let g:jsx_ext_required = 0

" generic shortcuts
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
imap jj <Esc>

" delimitmate settings
let delimitMate_expand_cr = 1

" disable folding
set foldlevelstart=99
set foldlevel=99

" indentline
let g:indentLine_char = '┆'

" vifm
map <leader>f :EditVifm<CR>
