" set vundle
set rtp+=~/.vimcfg/bundle/Vundle.vim

call vundle#begin()

" common
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'ctrlpvim/ctrlp.vim.git'
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
Plugin 'editorconfig/editorconfig-vim'

" themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'ryanoasis/vim-devicons'
Plugin 'sickill/vim-monokai'

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

call vundle#end()

" airline settings
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='bubblegum'

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
set cursorline " show horizontal line at cursor position
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

" theme settings
syntax on
syntax enable
set background=dark
colorscheme gruvbox
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_dark='hard' " hard, medium, soft

" file type detection and plugin
filetype on
filetype plugin on

" ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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
let g:syntastic_html_checkers=['']
let g:syntastic_less_checkers=['']
let g:syntastic_css_checkers=['']
let g:syntastic_javascript_checkers=['']

" buffergator settings
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "basename"
let g:buffergator_show_full_directory_path = 0

" lesstocss settings
let g:lesscss_on = 0

" nerd settings
map <F5> :NERDTreeToggle<CR>

" netrw settings
let g:netrw_list_hide= '.*\.pyc$'
set wildmode=longest,list,full
nnoremap <silent> <F3> :e %:h<CR>

" beautify settings
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType javascript.jsx noremap <buffer>  <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType scss noremap <buffer> <c-f> :call CSSBeautify()<cr>

" react settings
let g:jsx_ext_required = 0

" generic shortcuts
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
imap jj <Esc>
