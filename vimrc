" ;d                       向下翻半屏
" ;u                       向上翻半屏
" ;1                       移动到行首
" ;2                       移动到行尾
" ;ce                      打开文件目录树
" ;il                      打开identLine
" ;rb                      去除一行尾部的空白
" ;rt                      一键替换全部 Tab 为空格
" ;s                       水平分割
" ;v                       竖直分割
" ;cc                      加注释
" ;cu                      取消注释
" ;c<space>                加上注释/取消注释，智能判断
" ;cy                      先复制，再注释
"
" ----------- 格式化命令 ----------------
"
" ==                       缩进当前行
" =G                       缩进直到文件结尾
" gg=G                     缩进整个文件
" 行号G=行号G              缩进指定区间
" u [小写]                 单步复原                 [非插入模式]
" U [大写]                 整行复原                 [非插入模式]
" Ctrl + R                 反撤消                   [非插入模式]
"
" ----------- 搜索命令 ------------------
"
" #                        向前搜索当前光标所在字符
" *                        向后搜索当前光标所在字符
" ?                        向前搜索
" /                        向后搜索
" :%s/xx/yy/g              正则搜索替换
"
" ----------- 跳转命令 ------------------
"
" %                        在匹配的括号间跳跃
" { or }                   按段落上/下跳跃
" gd                       跳至当前光标所在单词首次出现的位置
" zt                       将光标所在行移动到窗口的顶端
" zz                       将光标所在行移动到窗口的中间
" zb                       将光标所在行移动到窗口的底部
"
" ----------- 文本操作 --------------------
"
" dw de d0 d^ d$ dd        删除
" cw ce c0 c^ c$ cc        删除并进入插入模式
" yw ye y0 y^ y$ yy        复制
" vw ve v0 v^ v$ vv        选中
"
" di分隔符                 删除指定分隔符之间的内容               [不包括分隔符]
" ci分隔符                 删除指定分隔符之间的内容并进入插入模式 [不包括分隔符]
" yi分隔符                 复制指定分隔符之间的内容               [不包括分隔符]
" vi分隔符                 选中指定分隔符之间的内容               [不包括分隔符]
"
" da分隔符                 删除指定分隔符之间的内容               [包括分隔符]
" ca分隔符                 删除指定分隔符之间的内容并进入插入模式 [包括分隔符]
" ya分隔符                 复制指定分隔符之间的内容               [包括分隔符]
" va分隔符                 选中指定分隔符之间的内容               [包括分隔符]
"
" Xi和Xa都可以在X后面加入一数字，以指代所处理的括号层次
" 如 d2i( 执行的是删除当前  外围第二层括号内的所有内容
"
" dt字符                   删除本行内容，直到遇到第一个指定字符               [不包括该字符]
" ct字符                   删除本行内容，直到遇到第一个指定字符并进入插入模式 [不包括该字符]
" yt字符                   复制本行内容，直到遇到第一个指定字符               [不包括该字符]
" vt字符                   选中本行内容，直到遇到第一个指定字符               [不包括该字符]
"
" df字符                   删除本行内容，直到遇到第一个指定字符               [包括该字符]
" cf字符                   删除本行内容，直到遇到第一个指定字符并进入插入模式 [包括该字符]
" yf字符                   复制本行内容，直到遇到第一个指定字符               [包括该字符]
" vf字符                   选中本行内容，直到遇到第一个指定字符               [包括该字符]
"
" cs'"                     将外围的单引号变成双引号       [surround 插件]
" cs"<p>                   将外围的双引号变成 HTML 标签对 [surround 插件]
" cst"                     将外围的界定符变成双引号       [surround 插件]
" ds"                      删除外围的双引号定界符         [surround 插件]
" ysiw"                    为单词增加双引号
"
" 省略警告
let g:coc_disable_startup_warning = 1
" 让setting变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 设置leader键
let mapleader=";"
" 进入插入模式下的光标形状: 闪烁的竖线
let &t_SI.="\e[5 q"
" " 进入替换模式下的光标形状: 闪烁的下划线
let &t_SR.="\e[3 q"
" " 从插入模式或替换模式下退出，进入普通模式后的光标形状: 闪烁的方块
let &t_EI.="\e[1 q"
" " 进入vim时，设置普通模式下的光标形状: 闪烁的方块
autocmd VimEnter * silent !echo -ne "\e[1 q"
" " 离开vim后，恢复shell模式下的光标形状: 闪烁的竖线
autocmd VimLeave * silent !echo -ne "\e[5 q"
" kj 替换 Esc
inoremap kj <Esc>
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

" 加载插件管理器
call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'google/vim-searchindex'
Plug 'jlanzarotta/bufexplorer'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" 同步剪切板
set clipboard=unnamed
set guifont=Monaco\ 11
" 针对terminal背景灰色
let g:dracula_colorterm = 0
" 设置通用缩进策略
set shiftwidth=4
set tabstop=4
" 对部分语言设置单独的缩进 [两空格缩进]
au FileType scheme,racket,sh,lisp,clojure,lfe,elixir,eelixir,ruby,eruby,coffee,slim,pug,scss set shiftwidth=2
au FileType scheme,racket,sh,lisp,clojure,lfe,elixir,eelixir,ruby,eruby,coffee,slim,pug,scss set tabstop=2
" ;c 复制至公共剪贴板
" vmap <leader>c "+y
" ;a 复制所有至公共剪贴板
" nmap <leader>a <esc>ggVG"+y<esc>
" ;v 从公共剪贴板粘贴
" imap <leader>v <esc>"+p
" nmap <leader>v "+p
" vmap <leader>v "+p

set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
set ruler                    " 右下角显示光标位置的状态行
set cul                      " 浅色高亮当前行
" set cuc                      " 浅色高亮当前列
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
set laststatus=1             " 开始状态栏信息
set cmdheight=1              " 命令行的高度，默认为1，这里设为2
set autoread                 " 当文件在外部被修改时自动更新该文件
set nobackup                 " 不生成备份文件
set noswapfile               " 不生成交换文件
set list                     " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set listchars=tab:\~\ ,trail:.
set expandtab                " 将 Tab 自动转化成空格 [需要输入真正的 Tab 符时，使用 Ctrl+V + Tab]
set showmatch                " 显示括号配对情况
" 取消换行
set nowrap
" How many tenths of a second to blink when matching brackets
set matchtime=2
set splitbelow               " :sp  切分窗口显示在下侧
set splitright               " :vsp 切分窗口显示在右侧
set shell=zsh               " Terminal 默认使用 Bash
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7
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
inoremap { {}<ESC>i
" 花括号自动跳转到下一行
" inoremap { {<CR>}<ESC>O
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

" indentLine          显示对齐线
map <leader>il :IndentLinesToggle<CR>
let g:indentLine_enabled    = 1                " 默认关闭
let g:indentLine_char_list = ['|', '¦', '┆', '┊']  " 设置对齐线字符，每个层级都可以不一样
let g:indentLine_color_term = 239              " 设置非 GUI 线条颜色
let g:indentLine_color_gui  = '#A4E57E'        " 设置 GUI 线条颜色

" AirLine             彩色状态栏
let g:airline_theme           = 'badwolf'      " 设置主题
let g:airline_powerline_fonts = 0              " 关闭自定义字体

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
" NERDTree            树形文件浏览器
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

" ;ce                 打开文件树窗口，在左侧栏显示 [NERDTree 插件]
nmap <leader>ce :NERDTree<cr>

" 搜索相关
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" switch # *
nnoremap # *
nnoremap * #

" => 选中及操作改键
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv
" y$ -> Y Make Y behave like other capitals
map Y y$
" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly save the current file
nnoremap <leader>w :w<CR>
