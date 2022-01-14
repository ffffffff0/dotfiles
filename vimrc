" ----------- Leader 系按键 -------------
" ;d          向下翻半屏
" ;u          向上翻半屏
" ;1          移动到行首
" ;2          移动到行尾
" ;nt         打开文件目录树
" ;rb         去除一行尾部的空白
" ;rt         一键替换全部 Tab 为空格
" ;s          水平分割
" ;v          竖直分割
" 更改主题
" set background=dark
colorscheme monokai
set guifont=Monaco\ 11
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
" 加载pathogen 插件管理器
execute pathogen#infect()
execute pathogen#helptags()
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
" ;c 复制至公共剪贴板         [仅选择模式]
" ;a 复制所有至公共剪贴板     [Normal 模式可用]
" ;v 从公共剪贴板粘贴         [全模式可用]
" 设置leader键
let mapleader=";"
" ;c 复制至公共剪贴板
vmap <leader>c "+y
" ;a 复制所有至公共剪贴板
nmap <leader>a <esc>ggVG"+y<esc>
" ;v 从公共剪贴板粘贴
imap <leader>v <esc>"+p
nmap <leader>v "+p
vmap <leader>v "+p
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
set showmatch               " 显示括号配对情况
set splitbelow               " :sp  切分窗口显示在下侧
set splitright               " :vsp 切分窗口显示在右侧
set shell=bash               " Terminal 默认使用 Bash
" 向下翻半屏
nmap <Leader>u <C-U>
" 向上翻半屏
nmap <Leader>d <C-D>
" 快速移动到行首，行尾
map <Leader>1 ^
map <Leader>2 $
" 设置快捷键遍历各个分割窗口
nnoremap <Leader>gg <C-W><C-W>
" 向左
nnoremap <leader>h <C-W><C-H>
" 向右
nnoremap <leader>l <C-W><C-L>
" 向上
nnoremap <Leader>k <C-W><C-K>
" 向下
nnoremap <Leader>j <C-W><C-J>
" 水平分割
nmap <Leader>s :Sex<CR>
" 竖直分割
nmap <Leader>v :Vex<CR>
" 括号匹配
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
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
" NERDTree            树形文件浏览器
let NERDTreeWinPos="left"
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
" ;nt                 打开文件树窗口，在左侧栏显示 [NERDTree 插件]
nnoremap <leader>nt :NERDTree<CR>
" ;rb                 一键去除全部尾部空白
imap <leader>rb <esc>:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
nmap <leader>rb :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
vmap <leader>rb <esc>:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
" ;rt                 一键替换全部 Tab 为空格
nmap <leader>rt <esc>:retab<cr>
" ;ra                 一键清理当前代码文件
nmap <leader>ra <esc>\rt<esc>\rb<esc>gg=G<esc>gg<esc>
" NERD_commenter      注释处理插件
let NERDSpaceDelims = 1                        " 自动添加前置空格
