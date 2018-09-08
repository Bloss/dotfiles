" ===============基础设置===============

" 设置空白字符的视觉提示
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽
" set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" 高亮当前行
set cursorline

" 高亮当前行
set cursorline
" 清除当前的高亮行
hi clear CursorLine
" 设置高亮行的行号字体颜色
hi CursorLineNR ctermfg=yellow
" 加粗高亮行的行号
hi CursorLineNR cterm=bold

" 显示行号
set number

" 语法高亮
syntax on

" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 识别特殊文件类型的缩进插件
filetype indent on

" 文件 ignore
set wildmenu

" ignore 编译后的文件
set wildignore=*.o,*~,*.pyc

" ignore 一些 dotfile
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store

" Tab and Indent
set tabstop=4 " tab 变成 4 个字符宽度
set softtabstop=4 " 删除的时候可以一次性删除四个空格
set shiftwidth=4 " 自动缩进的长度, 和 tabstop 保持一致
set smarttab
set expandtab " 用空格代替 tab
set autoindent " 新的一行继承上一行的缩进
set smartindent 
set cindent " 使用 c 风格的缩进

" 搜索和高亮相关
set hlsearch " 高亮搜索结果
set incsearch " hightlight while searching with /
set ignorecase " 搜索关键字忽略大小写
set smartcase " 多于一个大写的时候, 保持大小写敏感
set showmatch " 插入括号的时候, 短暂的跳转到匹配的对应括号
set wrapscan " 在搜索到文件两端时重新开始搜索

" 针对一些文件设置特定的缩进方式
autocmd FileType html set shiftwidth=2|set expandtab
autocmd FileType htmljinja setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandta
b
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Display
set showmode " 显示当前的 mode
set t_Co=256 " 256 color

" other
set rnu " 开启相对行号
hi LineNr ctermfg=red
set showtabline=2
set nobackup " 去除每一次编辑后的 ~ 文件
set nowb
set noswapfile " 去除交换文件
set fileencodings=utf-8,gb18030,cp936,big5 " 设置文件编码

" common keymap
" split window
let mapleader = ' '
map <leader>sp :sp<CR>
map <leader>spv :vsp<CR>

" bookmark
let mapleader = 'b'
" 上一个文件
map <leader>n :bn<CR> 
" 下一个文件
map <leader>p :bp<CR>

" Highlight TODO/FIXME/XXX
highlight myTODO cterm=bold term=bold ctermbg=yellow ctermfg=black
match myTODO /\(TODO\|XXX\|FIXME\)/

" ===============Enhance===============

" .md 文件类型
au BufRead,BufNewFile *.md set filetype=markdown 

" python 文件自动添加 header
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1,  "# -*- coding: utf-8 -*-")
    call append(2,  "# stickmy @ " . strftime('%Y-%m-%d', localtime()))
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

" sh 文件类型自动添加 header
function HeaderBash()
    call setline(1, "#!/bin/bash")
    call setline(2, "# stickmy @ " . strftime('%Y-%m-%d', localtime()))
    normal G
    normal o
endf
autocmd bufnewfile *.sh all HeaderBash()


" zsh 文件类型自动添加 header
function HeaderZsh()
    call setline(1, "#!/bin/zsh")
    call setline(2, "# stickmy @ " . strftime('%Y-%m-%d', localtime()))
    normal G
    normal o
endf
autocmd bufnewfile *.zsh all HeaderZsh()


" js 文件类型自动添加 header
function HeaderJs()
    call setline(1, "/**")
    call setline(2, " * author: stickmy date " . strftime('%Y-%m-%d', localtime()))
    call setline(3, " */")
    normal G
    normal o
endf
autocmd bufnewfile *.js,*.jsx,*.ts,*.tsx call HeaderJs()


" ===============Hacks===============
" ycmd server https://github.com/Valloric/YouCompleteMe/issues/914
" let g:ycm_python_binary_path = 'python'
" let g:ycm_server_python_interpreter = ''

" ===============插件设置===============

call plug#begin()

" 状态栏
Plug 'vim-airline/vim-airline'

" 状态栏主题
Plug 'ap/vim-buftabline'

Plug 'vim-airline/vim-airline-themes'

" html & css 语言扩展
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'posva/vim-vue'

" javascript 语言扩展
Plug 'pangloss/vim-javascript' " 提升indent 检测
Plug 'ternjs/tern_for_vim' " javascript 自动完成
Plug 'mxw/vim-jsx' " react-jsx 语法
Plug 'leafgarland/typescript-vim' " ts 语法

" Go 语言扩展
Plug 'fatih/vim-go'

" Markdown
Plug 'sjl/badwolf'

" 注释增强插件
Plug 'scrooloose/nerdcommenter'

" 括号匹配
Plug 'jiangmiao/auto-pairs'

" 文件树
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter' " 在文件中显示 git diff 的结果
Plug 'jistr/vim-nerdtree-tabs'

" 自动完成
Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" 多行编辑
Plug 'terryma/vim-multiple-cursors'

call plug#end()

" ===============Plugin Option===============

" =====airline=====
let g:airline_theme='murmur'

" =====Multiple cursor=====
" Multip Cursor

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" =====nerdcommenter=====
" https://github.com/scrooloose/nerdcommenter

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" =====NerdTree=====

" 显示隐藏文件 -> .dotfile
let NERDTreeShowHidden=1

" nmap <leader>ne :NERDTreeToggle<CR>
" 文件树统一的前缀操作为 c 
let mapleader = 'c'
nmap <leader>ne :NERDTreeToggle<CR>
nmap <leader>nb :NERDTreeFromBookmark<CR>
nmap <leader>nf :NERDTreeFind<CR>

" move window 窗口间切换用 cj 替换 Command + w + j
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l<Paste>

autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


" =====Emmet=====
" let g:user_emmet_leader_key='<C-Y>'

" =====tern_fro_vim=====
let tern_show_signature_in_pum = 1
let tern_show_argument_hints = 'on_hold'
autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete

" =====neocomplete=====

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" 自动启动.
let g:neocomplete#enable_at_startup = 1
" 自动大小写匹配.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
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
