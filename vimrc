"set color scheme
colorscheme monokai
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
" jk 替换 Esc
inoremap jk <Esc>

" 加载插件管理器
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'google/vim-searchindex'
Plug 'jlanzarotta/bufexplorer'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'jiangmiao/auto-pairs'
Plug 'bagrat/vim-buffet'
Plug 'andymass/vim-matchup'
call plug#end()
" jsonc settings 让json 的注释不报错
autocmd BufRead,BufNewFile *.json set filetype=jsonc
" 同步剪切板
set clipboard=unnamed
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
nnoremap <leader>a <C-W><C-H>
" 向右
nnoremap <leader>d <C-W><C-L>
" 水平分割
nmap <Leader>s :Sex<CR>
" 竖直分割
nmap <Leader>v :Vex<CR>
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
" t 在标签页中打开
" T 在后台标签页中打开
" p 到上层目录
" P 到根目录
" K 到同目录第一个节点
" J 到同目录最后一个节点
" m 显示文件系统菜单（添加、删除、移动操作）

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
" Quickly close the current window
nnoremap <leader>q :q<CR>
" Quickly save the current file
nnoremap <leader>w :w<CR>

"**************coc.vim*******************************
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" rename symbol
nmap <leader>rs  <Plug>(coc-rename)
" go to definition
nmap <silent> gd <Plug>(coc-definition)
" go to type definition
nmap <silent> gy <Plug>(coc-type-definition)
" go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" go to references
nmap <silent> gr <Plug>(coc-references)
" floaterm            浮动termianl
let g:floaterm_wintype       = 'float'
let g:floaterm_keymap_hide   = '<leader>fh'
let g:floaterm_keymap_new    = '<leader>ff'
let g:floaterm_keymap_kill   = '<leader>fk'
let g:floaterm_keymap_show   = '<leader>fs'
let g:floaterm_height = 1.0

" vim buffer
" 向后遍历 buffer 窗口
noremap <Leader>l :bn<CR>
" 向前遍历窗口
noremap <Leader>h :bp<CR>
" 关闭窗口, 不能有修改，向前遍历
noremap <Leader>q :Bw<CR>
" 关闭窗口,舍弃修改，向前遍历
noremap <Leader>!q :Bw!<CR>
" 创建一个tab
noremap <Leader>nt :tabnew split<CR>

" always show tabline and index
let g:buffet_always_show_tabline=1
let g:buffet_show_index=1

let g:buffet_powerline_separators = 1
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
