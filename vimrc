" 更改主题
set background=dark
" colorscheme monokai
" 判断操作系统类型
if(has('win32') || has('win64'))
    let g:isWIN = 1
    let g:isMAC = 0
else
    if system('uname') =~ 'Darwin'
        let g:isWIN = 0
        let g:isMAC = 1
    else
        let g:isWIN = 0
        let g:isMAC = 0
    endif
endif
" 设置 ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" 设置通用缩进策略
set shiftwidth=4
set tabstop=4
" 对部分语言设置单独的缩进 [两空格缩进]
au FileType scheme,racket,lisp,clojure,lfe,elixir,eelixir,ruby,eruby,coffee,slim,pug,scss set shiftwidth=2
au FileType scheme,racket,lisp,clojure,lfe,elixir,eelixir,ruby,eruby,coffee,slim,pug,scss set tabstop=2
" indentLine 显示对齐线
let g:indentLine_enabled    = 0                " 默认关闭
let g:indentLine_char_list = ['|', '¦', '┆', '┊']  " 设置对齐线字符，每个层级都可以不一样
let g:indentLine_color_term = 239              " 设置非 GUI 线条颜色
let g:indentLine_color_gui  = '#A4E57E'        " 设置 GUI 线条颜色

" AirLine 彩色状态栏
let g:airline_theme           = 'badwolf'      " 设置主题
let g:airline_powerline_fonts = 0              " 关闭自定义字体
" \c 复制至公共剪贴板         [仅选择模式]
" \a 复制所有至公共剪贴板     [Normal 模式可用]
" \v 从公共剪贴板粘贴         [全模式可用]
" 设置leader键
let mapleader=";"
" \c 复制至公共剪贴板
vmap <leader>c "+y
" \a 复制所有至公共剪贴板
nmap <leader>a <esc>ggVG"+y<esc>
" \v 从公共剪贴板粘贴
imap <leader>v <esc>"+p
nmap <leader>v "+p
vmap <leader>v "+p
" 根据后缀名指定文件类型
au BufRead,BufNewFile *.h        set ft=c
au BufRead,BufNewFile *.i        set ft=c
au BufRead,BufNewFile *.m        set ft=objc
au BufRead,BufNewFile *.di       set ft=d
au BufRead,BufNewFile *.ss       set ft=scheme
au BufRead,BufNewFile *.cl       set ft=lisp
au BufRead,BufNewFile *.phpt     set ft=php
au BufRead,BufNewFile *.inc      set ft=php
au BufRead,BufNewFile *.cson     set ft=coffee
au BufRead,BufNewFile *.sql      set ft=mysql
au BufRead,BufNewFile *.tpl      set ft=smarty
au BufRead,BufNewFile *.txt      set ft=txt
au BufRead,BufNewFile *.log      set ft=conf
au BufRead,BufNewFile hosts      set ft=conf
au BufRead,BufNewFile *.conf     set ft=dosini
au BufRead,BufNewFile http*.conf set ft=apache
au BufRead,BufNewFile *.ini      set ft=dosini

au BufRead,BufNewFile */nginx/*.conf        set ft=nginx
au BufRead,BufNewFile */nginx/**/*.conf     set ft=nginx
au BufRead,BufNewFile */openresty/*.conf    set ft=nginx
au BufRead,BufNewFile */openresty/**/*.conf set ft=nginx

au BufRead,BufNewFile *.yml.bak      set ft=yaml
au BufRead,BufNewFile *.yml.default  set ft=yaml
au BufRead,BufNewFile *.yml.example  set ft=yaml

au BufRead,BufNewFile CMakeLists.txt set ft=cmake

set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
set ruler                    " 右下角显示光标位置的状态行

set relativenumber           " 开启相对行号
set nu!                      " 显示行号
set incsearch                " 开始实时搜索
set hlsearch                 " 开启高亮显示结果
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
set foldmethod=indent        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
set laststatus=2             " 开始状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set autoread                 " 当文件在外部被修改时自动更新该文件
set nobackup                 " 不生成备份文件
set noswapfile               " 不生成交换文件
set list                     " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set listchars=tab:\~\ ,trail:.
set expandtab                " 将 Tab 自动转化成空格 [需要输入真正的 Tab 符时，使用 Ctrl+V + Tab]
"set showmatch               " 显示括号配对情况
set splitbelow               " :sp  切分窗口显示在下侧
set splitright               " :vsp 切分窗口显示在右侧
set shell=bash               " Terminal 默认使用 Bash

" 使用 vimdiff 时，长行自动换行
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全


" 设置文件编码和文件格式
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,mac,dos

" 针对部分语言添加字典补全
au FileType c      call AddCDict()
au FileType cpp    call AddCPPDict()
au FileType rust   call AddRustDict()
au FileType go     call AddGoDict()
au FileType java   call AddJavaDict()
au FileType lua    call AddLuaDict()
au FileType perl   call AddPerlDict()
au FileType php    call AddPHPDict()
au FileType python call AddPythonDict()
au FileType mysql  call AddMySQLDict()

au FileType elixir,eelixir call AddElixirDict()
au FileType ruby,eruby     call AddRubyDict()

au FileType html,gohtmltmpl,eelixir,blade,volt,*.twig,htmldjango,jinja,eruby,jst call AddHTMLDict()
au FileType smarty,mustache,handlebars,vue,jsx                                   call AddHTMLDict()
au FileType css,scss,less                                                        call AddCSSDict()
au FileType javascript,coffee,typescript,ls                                      call AddJavaScriptDict()

au FileType slim,pug call AddHTMLDict()
au FileType slim,pug call AddCSSDict()
au FileType slim,pug call AddJavaScriptDict()

au FileType Dockerfile     call AddDockerfileDict()
au FileType docker-compose call AddDockerComposeDict()


function AddCDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/c.txt
    else
        set dict+=~/.vim/dict/c.txt
    endif
    set complete+=k
endfunction


function AddCPPDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/c.txt
        set dict+=$VIM/vimfiles/dict/cpp.txt
    else
        set dict+=~/.vim/dict/c.txt
        set dict+=~/.vim/dict/cpp.txt
    endif
    set complete+=k
endfunction

function AddRustDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/rust.txt
    else
        set dict+=~/.vim/dict/rust.txt
    endif
    set complete+=k
endfunction

function AddGoDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/go.txt
    else
        set dict+=~/.vim/dict/go.txt
    endif
    set complete+=k
endfunction

function AddJavaDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/java.txt
    else
        set dict+=~/.vim/dict/java.txt
    endif
    set complete+=k
endfunction

function AddElixirDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/elixir.txt
    else
        set dict+=~/.vim/dict/elixir.txt
    endif
    set complete+=k
endfunction

function AddLuaDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/lua.txt
        set dict+=$VIM/vimfiles/dict/love2d.txt
    else
        set dict+=~/.vim/dict/lua.txt
        set dict+=~/.vim/dict/love2d.txt
    endif
    set complete+=k
endfunction

function AddPerlDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/perl.txt
    else
        set dict+=~/.vim/dict/perl.txt
    endif
    set complete+=k
endfunction

function AddPHPDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/php.txt
    else
        set dict+=~/.vim/dict/php.txt
    endif
    set complete+=k
endfunction

function AddPythonDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/python.txt
    else
        set dict+=~/.vim/dict/python.txt
    endif
    set complete+=k
endfunction

function AddRubyDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/ruby.txt
    else
        set dict+=~/.vim/dict/ruby.txt
    endif
    set complete+=k
endfunction

function AddMySQLDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/mysql.txt
    else
        set dict+=~/.vim/dict/mysql.txt
    endif
    set complete+=k
endfunction

function AddCSSDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/css.txt
    else
        set dict+=~/.vim/dict/css.txt
    endif
    set complete+=k
endfunction

function AddJavaScriptDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/javascript.txt
    else
        set dict+=~/.vim/dict/javascript.txt
    endif
    set complete+=k
endfunction

function AddHTMLDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/html.txt
    else
        set dict+=~/.vim/dict/html.txt
    endif
    set complete+=k
endfunction

function AddDockerfileDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/Dockerfile.txt
    else
        set dict+=~/.vim/dict/Dockerfile.txt
    endif
    set complete+=k
endfunction

function AddDockerComposeDict()
    if g:isWIN
        set dict+=$VIM/vimfiles/dict/docker-compose.txt
    else
        set dict+=~/.vim/dict/docker-compose.txt
    endif
    set complete+=k
endfunction
" DTree            树形文件浏览器
let g:NERDTreeShowHidden            = 1        " 显示隐藏文件   [NERDTree]
let g:NERDTreeGitStatusShowIgnored  = 1        " 显示被忽略图标 [NERDTree-Git-Plugin]
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  : '✹',
            \ 'Staged'    : '✚',
            \ 'Untracked' : '✭',
            \ 'Renamed'   : '➜',
            \ 'Unmerged'  : '═',
            \ 'Deleted'   : '✖',
            \ 'Dirty'     : '✗',
            \ 'Clean'     : '✔︎',
            \ 'Unknown'   : '?'
            \ }                                " 为 NERDTree-Git-Plugin 设定各个状态对应的符号
" indentLine          显示对齐线
let g:indentLine_enabled    = 1                " 默认关闭
let g:indentLine_char_list = ['|', '¦', '┆', '┊']  " 设置对齐线字符，每个层级都可以不一样
let g:indentLine_color_term = 239              " 设置非 GUI 线条颜色
let g:indentLine_color_gui  = '#A4E57E'        " 设置 GUI 线条颜色
" AirLine             彩色状态栏
let g:airline_theme           = 'badwolf'      " 设置主题
let g:airline_powerline_fonts = 0              " 关闭自定义字体
" 高亮当前行列
set cursorline
" Ctrl + ]            多选择跳转
nmap <c-]> g<c-]>
vmap <c-]> g<c-]>
" Ctrl + T            跳回原位置
nmap <c-t> :pop<cr>
" Ctrl + U            简化全能补全按键
imap <c-u> <c-x><c-o>
" Ctrl + H            光标移当前行行首[插入模式]、切换左窗口[Normal 模式]
imap <c-h> <esc>I
map <c-h> <c-w><c-h>

" Ctrl + J            光标移下一行行首[插入模式]、切换下窗口[Normal 模式]
imap <c-j> <esc><down>I
map <c-j> <c-w><c-j>

" Ctrl + K            光标移上一行行尾[插入模式]、切换上窗口[Normal 模式]
imap <c-k> <esc><up>A
map <c-k> <c-w><c-k>

" Ctrl + L            光标移当前行行尾[插入模式]、切换右窗口[Normal 模式]
imap <c-l> <esc>A
map <c-l> <c-w><c-l>
" \nt                 打开文件树窗口，在左侧栏显示 [NERDTree 插件]
nmap <leader>nt :NERDTree<cr>
" \rb                 一键去除全部尾部空白
imap <leader>rb <esc>:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
nmap <leader>rb :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
vmap <leader>rb <esc>:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>

" \rm                 一键去除全部 ^M 字符
imap <leader>rm <esc>:%s/<c-v><c-m>//g<cr>
nmap <leader>rm :%s/<c-v><c-m>//g<cr>
vmap <leader>rm <esc>:%s/<c-v><c-m>//g<cr>

" \rt                 一键替换全部 Tab 为空格
nmap <leader>rt <esc>:retab<cr>

" \ra                 一键清理当前代码文件
nmap <leader>ra <esc>\rt<esc>\rb<esc>gg=G<esc>gg<esc>

" NERD_commenter      注释处理插件
let NERDSpaceDelims = 1                        " 自动添加前置空格
