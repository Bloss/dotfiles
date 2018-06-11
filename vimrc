set nocompatible  " 使用 vim 的键盘模式

if filereadable(expand("~/.vim/bundle/bvimrc.vundle"))
  source ~/.vim/bundle/vimrc.vundle
endif

set nu  " 显示行号
syntax on  " 语法高亮
"set autochdir  " 设置当前的目录为工作目录
filetype on  " 侦测文件类型
filetype plugin on  " 载入文件类型插件
filetype indent on  " 识别特殊文件类型的缩进插件

" system
set ttyfast      " Faster redrawing.
set lazyredraw   " Only redraw when necessary.

let mapleader = ","
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Fast saving <,w>
nmap <leader>w :w!<cr>
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" ignore
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*,.idea\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store
endif

" Tab and Indent
set tabstop=4 " tab 变成 4 个字符宽度 ts
set softtabstop=4 " 删除的时候可以一次性删除四个空格 sts
set shiftwidth=4 " 自动缩进的长度 最好和 tabstop 保持一致 sw
set smarttab
set expandtab  " 用空格代替 tab
set autoindent  " 新行继承上一行的缩进
set smartindent " 为 C 提供自动缩进
set cindent " 使用 C 风格的缩进

" Seach and Match
set hlsearch  " 高亮搜索结果
set incsearch  " Highlight while searching with /
set ignorecase " 搜索忽略大小写
set smartcase " 多于一个大写保持敏感
set showmatch  " 插入括号时，短暂地跳转到匹配的对应括号
set wrapscan " 在搜索到文件两端时重新搜索 <nowrapscan>

" Display
set showmode  " Show the current mode
set t_Co=256  " If under tty, use 256

" Display tab and trail space
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
" Not display above list
nmap <leader>l :set list!<CR>

" Other
set nobackup " 去除每一次编写的 ~ 后缀备份文件
set nowb
set noswapfile

set fileencodings=utf-8,gb18030,cp936,big5 " 设置编码
" set pastetoggle=<F10>  " Bind `F10` to `:set paste`
set pastetoggle=<leader>p
set backspace=2 " same as ":set backspace=indent,eol,start" in vim7.4

" Press `shift` while selecting with the mouse can disable into visual mode
" In mac os, hold `alt/option` is easier
" ref: http://stackoverflow.com/questions/4608161/copy-text-out-of-vim-with-set-mouse-a-enabled
set mouse=a  " Enable mouse

set foldmethod=syntax  " The kind of folding used for the current window
set foldlevel=99

" -------------------------------------------------------------------------------
" Enhanced
" -------------------------------------------------------------------------------

au BufRead,BufNewFile *.md set filetype=markdown  " .md 文件类型

" Execute python file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" Auto add head info
" python 文件自动添加 header
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1,  "# -*- coding: utf-8 -*-")
    call append(2,  "# stickmy @ " . strftime('%Y-%m-%d', localtime()))
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

" sh 文件自动添加 header
function HeaderBash()
    call setline(1, "#!/bin/bash")
    call append(1,  "# stickmy @ " . strftime('%Y-%m-%d', localtime()))
    normal G
    normal o
endf
autocmd bufnewfile *.sh call HeaderBash()

" ref: http://stackoverflow.com/questions/158968/changing-vim-indentation-behavior-by-file-type
autocmd FileType html set shiftwidth=4|set expandtab
autocmd FileType htmljinja setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType css setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType sh setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" 关键字快速跳转
runtime macros/matchit.vim

" quick expand current active file's directory (not work directory)
" use `%%' to auto expand instead of `%:h<Tab>'
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" -------------------------------------------------------------------------------
" Bind Keys
" -------------------------------------------------------------------------------

" <C-l>: 临时关闭高亮搜索
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


" ===============================================================================
" Vundle Configuration
" ===============================================================================

set nocompatible               " be iMproved, required
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 指定安装 vundle 插件的路径
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required!
Plugin 'gmarik/Vundle.vim'

" Vundles

" Display
"Plugin 'Lokaltog/vim-powerline'  " newer powerline is https://github.com/powerline/powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/tomorrow-theme'
Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'Yggdroot/indentLine'
" Note vim-colorschemes will cause vim-powerline not work if :tabnew
" Plugin 'flazz/vim-colorschemes'  " themes collection
Plugin 'Color-Scheme-Explorer'

" Python
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'mitsuhiko/vim-jinja'
"Plugin 'kevinw/pyflakes-vim'
"Plugin 'fs111/pydoc.vim'
"Plugin 'Pydiction'
"Plugin 'pep8'

" HTML & CSS
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'posva/vim-vue' " vue syntax
" JavaScript
Plugin 'pangloss/vim-javascript'  " improved indentation
Plugin 'ternjs/tern_for_vim'  " js autocompletion
Plugin 'mxw/vim-jsx' " react-jsx
Plugin 'Shutnik/jshint2.vim'

" Go
Plugin 'fatih/vim-go'

" Markdown
Plugin 'sjl/badwolf'

" Enhanced
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'Shougo/neocomplete.vim'  " neocomplete need vim --with-lua
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'  " needed with SirVer/ultisnips
Plugin 'AndrewRadev/splitjoin.vim'  " transition between multiline and single-line code
Plugin 'Tagbar'  " Tagbar is more powerful than 'taglist.vim'
Plugin 'Auto-Pairs'  " Auto-Pairs is more useful than AutoClose
"Plugin 'godlygeek/tabular'
Plugin 'hotoo/pangu.vim'
Plugin 'easymotion/vim-easymotion'


if has('mac') || has('macunix')
    Plugin 'rizzatti/dash.vim'
endif

call vundle#end()             " required!
filetype plugin indent on     " required!
" To ignore plugin indent changes, instead use:
"filetype plugin on"
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" -------------------------------------------------------------------------------
" Lokaltog/vim-powerline
" -------------------------------------------------------------------------------
let g:Powerline_symbols = 'unicode' " compatible/unicode/fancy
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

" -------------------------------------------------------------------------------
" react-jsx extend support
" -------------------------------------------------------------------------------
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1

" -------------------------------------------------------------------------------
" vim-airline/vim-airline
" -------------------------------------------------------------------------------
" Keep vim-powerline configuration opened
" In Mac with iTerm2, need to select patched font for non-ascii font, in
" Profiles -> Text
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'


" -------------------------------------------------------------------------------
" kien/rainbow_parentheses.vim
" -------------------------------------------------------------------------------
" always on
au VimEnter *.py,*.js,*.html,*.css,*.sls RainbowParenthesesToggle
au Syntax *.py,*.js,*.html,*.css,*.sls RainbowParenthesesLoadRound
au Syntax *.py,*.js,*.html,*.css,*.sls RainbowParenthesesLoadSquare
au Syntax *.py,*.js,*.html,*.css,*.sls RainbowParenthesesLoadBraces

" the outer layer is the last pair
" remove black for dark terminal
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 15

" -------------------------------------------------------------------------------
" Yggdroot/indentLine
" -------------------------------------------------------------------------------
"   https://github.com/Yggdroot/indentLine
" let g:indentLine_char='┆'
" let g:indentLine_enabled = 1

" -------------------------------------------------------------------------------
" davidhalter/jedi-vim
" -------------------------------------------------------------------------------
"   Goto assignments <leader>g (typical goto function)
"   Goto definitions <leader>d (follow identifier as far as possible, includes
"   imports and statements)
"   Show Documentation/Pydoc K (shows a popup with assignments)
"   Renaming <leader>r
"   Usages <leader>n (shows all the usages of a name)
"   Open module, e.g. :Pyimport os (opens the os module)
autocmd FileType python setlocal completeopt-=preview    " disable docstring
let g:jedi#completions_command = "<C-N>"

" -------------------------------------------------------------------------------
" nvie/vim-flake8
" -------------------------------------------------------------------------------
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
let g:flake8_quickfix_height=5
let g:flake8_show_in_gutter=1
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
autocmd BufWritePost *.py call Flake8()

" ----------------------------------------------------------------------------
" mattn/emmet-vim
" ----------------------------------------------------------------------------
"   trigger key: <c-y>,  " note with comma
"   html:5
"   <c-y>n: next edit point
"   <c-y>N: previous edit point
"   <c-y>d: select whole label
"   <c-y>D: select whole label content
"   <c-y>k: delete current label


" ----------------------------------------------------------------------------
" hail2u/vim-css3-syntax
" ----------------------------------------------------------------------------
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END


" ----------------------------------------------------------------------------
" auto load nerdtree
" ----------------------------------------------------------------------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" ----------------------------------------------------------------------------
" ternjs/tern_for_vim
" ----------------------------------------------------------------------------
let tern_show_signature_in_pum = 1
let tern_show_argument_hints = 'on_hold'
autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete
"
" ----------------------------------------------------------------------------
" Shutnik/jshint2.vim
" ----------------------------------------------------------------------------
let jshint2_save = 1
" jshint validation
nnoremap <leader>j :JSHint<CR>

" ----------------------------------------------------------------------------
" scrooloose/nerdtree and jistr/vim-nerdtree-tabs
" ----------------------------------------------------------------------------
"nmap <leader>ne :NERDTreeToggle<CR>
let mapleader = ' '
nmap <leader>ne :NERDTreeTabsToggle<CR>
nmap <leader>nb :NERDTreeFromBookmark<CR>
nmap <leader>nf :NERDTreeFind<CR>

" move window 窗口间切换用 cj 替换 Command + w + j
let mapleader = 'c'
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l

" ----------------------------------------------------------------------------
" ervandew/supertab
" ----------------------------------------------------------------------------
set completeopt=longest,menu,preview
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"  " use omni completion instead of default
let g:SuperTabCrMapping = 1  " disable <enter> with newline, https://github.com/ervandew/supertab/issues/142

" ----------------------------------------------------------------------------
" Shougo/neocomplete.vim
" ----------------------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete  " for ternjs
autocmd FileType python setlocal omnifunc=jedi#completions  " for jedi
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" ----------------------------------------------------------------------------
" SirVer/ultisnips
" ----------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ----------------------------------------------------------------------------
" Tagbar
" ----------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
map <leader>tb :TagbarToggle<CR>
let g:tagbar_sort = 0

"let g:tagbar_type_markdown = {
"    \ 'ctagstype': 'markdown',
"    \ 'ctagsbin' : '/Users/TankyWoo/.dotfiles/markdown2ctags.py',
"    \ 'ctagsargs' : '-f - --sort=yes',
"    \ 'kinds' : [
"        \ 's:sections',
"        \ 'i:images'
"    \ ],
"    \ 'sro' : '|',
"    \ 'kind2scope' : {
"        \ 's' : 'section',
"    \ },
"    \ 'sort': 0,
"\ }

" ----------------------------------------------------------------------------
" airblade/vim-gitgutter
" ----------------------------------------------------------------------------
let g:gitgutter_max_signs = 500
"let g:gitgutter_highlight_lines = 1
highlight clear SignColumn

" ----------------------------------------------------------------------------
" SirVer/ultisnips
" ----------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ----------------------------------------------------------------------------
" rizzatti/dash.vim
" ----------------------------------------------------------------------------
" https://raw.githubusercontent.com/rizzatti/dash.vim/master/doc/dash.txt
let g:dash_map = {
  \ 'python' : ['py', 'python2', 'py3', 'python3']
  \ }
nmap <silent> <leader>da <Plug>DashSearch

" ----------------------------------------------------------------------------
" godlygeek/tabular
" ----------------------------------------------------------------------------
" use `Tab /|` to auto align '|'

" ----------------------------------------------------------------------------
" hotoo/pangu.vim
" https://github.com/hotoo/pangu.vim
" ----------------------------------------------------------------------------
autocmd BufWritePre *.markdown,*.md call PanGuSpacing()

" ----------------------------------------------------------------------------
" easymotion/vim-easymotion
" https://github.com/easymotion/vim-easymotion
" ----------------------------------------------------------------------------
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" ===============================================================================
" Color Settings
" ===============================================================================
" test color with run `:runtime syntax/colortest.vim`

set t_Co=256

" cc=81 to set max line length
if exists('+colorcolumn')
    " cc is only exist >= `Vim7.3`
    set cc= " Short for colorcolumn
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
hi ColorColumn ctermbg=lightgrey guibg=lightgrey " Highlighter cc

try
    set background=dark
    colorscheme Tomorrow-Night-Bright
    " Below syntax will affect vim-airline statusbar; write colorscheme
    " directly is ok
    " autocmd BufEnter * colorscheme Tomorrow-Night-Bright
    autocmd BufEnter *.md,*.mkd,*.markdown colorscheme badwolf
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

" for gui, such as macvim
if has("gui_running")
  "set guifont=Monaco:h12
  set guifont=Source\ Code\ Pro\ for\ Powerline:h14  " for vim-airline
  set gcr=a:blinkon0  "Disable cursor blink
  set lines=60
  set columns=150
endif

" Highlight TODO/FIXME/XXX
highlight myTODO cterm=bold term=bold ctermbg=yellow ctermfg=black
match myTODO /\(TODO\|XXX\|FIXME\)/

" this options can be setted with colors, and must be put after colorscheme
set cursorline " Highlighter the current line
"set cursorcolumn " Highlighter the vertical line"
hi search cterm=underline ctermfg=white

highlight PmenuSel cterm=underline,bold ctermfg=blue
