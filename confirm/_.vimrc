"""""""""""""""""""""""""""""
" BASIC CONFIG
""""""""""""""""""""""""""""""
syntax on
set ignorecase
set number
set ruler
set autoindent
set cindent
set tabstop=4
set laststatus=1
set softtabstop=4
set shiftwidth=4
set expandtab      "set TAB expands to spaces
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030
" set text auto next line when exceed 80 characters.
" set textwidth=80 formatoptions+=Mm
let mapleader='\'  " leader key, default is '\''
":help ins-completion-menu
set pumheight=15      " maximum height of popup menu
set autochdir         " auto change 'pwd' value
set shell=/bin/bash   " set vim default shell
" 'corsair.vim' under ~/.vim/colors/
:colorscheme corsair

""""""""""""""""""""""""""""""
" BASIC KEYBIND 
""""""""""""""""""""""""""""""
" Toggle paste mode, F11 usually for maximum
set pastetoggle=<F12>  
" Toggle line numbers 
noremap <F10> :set invnumber <CR>

""""""""""""""""""""""""""""""
" VIM BUNDLE 
""""""""""""""""""""""""""""""
set nocompatible   " be iMproved, required
set backspace=indent,eol,start
filetype off       " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" #1 case: plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" #2 case: Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" #3 case: git repos on your local machine 
" i.e. when working on your own plugin.
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Add plugins you need below.
" Plugin 'L9'
" Plugin 'OmniCppComplete'
" Plugin 'snipMate'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'tell-k/vim-autopep8'
" Plugin 'Lokaltog/vim-powerline'

"------ NEW PLUGINS -----
Plugin 'Tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'davidhalter/jedi'
"------ THREE ALGOTHER -----
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
"------ END OF THREE  -----
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""
" CONFIG TAGBAR
""""""""""""""""""""""""""""""
" When pressed F5, toggle tagbar window
nnoremap <silent> <F5> :call TagbarMyOpen()<CR><CR>
let g:Tagbar_title = "[Tagbar]"
" let g:tagbar_ctags_bin = "/usr/bin/ctags"
let g:tagbar_left = 0
let g:tagbar_width = 20
" originally Yellow value 11
highlight Search ctermbg=88
highlight TagbarSignature ctermfg=68
function! TagbarMyOpen()
    exec 'TagbarToggle'
endfunction

""""""""""""""""""""""""""""""
" CONFIG INDENTLINE
""""""""""""""""""""""""""""""
let g:indentLine_char = '|'
let g:indentLine_enabled = 0
nnoremap <silent> <F2> :IndentLinesToggle<CR>

""""""""""""""""""""""""""""""
" CONFIG AUTOPEP8
""""""""""""""""""""""""""""""
let g:autopep8_disable_show_diff = 1

""""""""""""""""""""""""""""""
" CONFIG NERDTREE 
""""""""""""""""""""""""""""""
" When pressed F3, toggle nerd tree
nnoremap <silent> <F3> :NERDTreeToggle<CR>
let g:NERDTree_title = "[NERDTree]"
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeWinSize = 20 " default 30
let g:NERDTreeWinPos = 'left' " only left or right

""""""""""""""""""""""""""""""
" CONFIG NERDCOMMENTER
""""""""""""""""""""""""""""""
"quick comment/uncomment
map <F4> <leader>ci <CR>
"add a space after comment flag
let g:NERDSpaceDelims=1

""""""""""""""""""""""""""""""
" CONFIG DELIMITMATE
""""""""""""""""""""""""""""""
autocmd VimEnter * imap <silent> <expr> <TAB> 
  \ delimitMate#ShouldJump() ?  delimitMate#JumpAny() : "\<C-r>=UltiSnips#ExpandSnippetOrJump()\<CR>"
autocmd VimEnter * inoremap <S-TAB> <S-TAB>
autocmd VimEnter * imap <expr> <CR>
  \ pumvisible() ?
  \   (exists('v:completed_item') && !empty(v:completed_item) &&
  \     v:completed_item.word != '' && v:completed_item.kind == 'f') ?
  \       "\<C-R>=\<SID>onCompleteDone()\<CR>" :
  \       "\<C-y>" :
  \   "\<Plug>delimitMateCR\<Plug>DiscretionaryEnd"

""""""""""""""""""""""""""""""
" CONFIG SUPERTAB
""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = '<C-n>'

""""""""""""""""""""""""""""""
" CONFIG ULTISNIPS
""""""""""""""""""""""""""""""
"Trigger configuration. Do not use <tab> 
"if you use https://github.com/Valloric/YouCompleteMe.
" 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""
" CONFIG YouCompleteMe
""""""""""""""""""""""""""""""
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.', 're![_a-zA-z0-9]'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::', 're![_a-zA-z0-9]'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
" let g:ycm_keep_logfiles = 1
" let g:ycm_log_level = 'debug'
set completeopt=longest,menu
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
"let g:ycm_key_invoke_completion = '<F9>'
let g:ycm_collect_identifiers_from_tags_files = 1 
let g:ycm_min_num_of_chars_for_completion = 2 
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_cache_omnifunc = 0
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"do not delete next line | specify python3 interpreter
let g:ycm_server_python_interpreter = '/usr/bin/python3'
" let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1 
" let g:ycm_autoclose_preview_window_after_completion = 0
