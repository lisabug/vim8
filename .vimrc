" Vimrc for Yuanqin Lu
" Last update: 2018.05.09


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/quickmenu.vim'

" Tag manager
Plug 'ludovicchabant/vim-gutentags'

" Asynchronous compile
Plug 'skywind3000/asyncrun.vim'

" Asynchronous Lint
Plug 'w0rp/ale'

" Version Control
Plug 'mhinz/vim-signify'

" Text Object Extension
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

" C++ Enhancement
Plug 'octol/vim-cpp-enhanced-highlight'

" Bracket mappings
Plug 'tpope/vim-unimpaired'

" Code Completion
Plug 'Valloric/YouCompleteMe'

" File Jump
Plug 'Yggdroot/LeaderF'

" Arguments hint
Plug 'Shougo/echodoc.vim'

" Auto Comments
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Fast comments
Plug 'scrooloose/nerdcommenter'
" Quotation, Brackets Completion
Plug 'Raimondi/delimitMate'
" DirectoryTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'szw/vim-ctrlspace'

" Python Syntax Highlight
Plug 'hdima/python-syntax'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" 让配置变更立即生效
autocmd! BufWritePost $MYVIMRC source $MYVIMRC

""" Vim Basic Configures
" Vim basic setting
let g:mapleader=';'
let mapleader=';'

" 开启语法高亮
syntax enable
syntax on
" 文件类型检查
filetype on
" 针对不同的文件采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

set autoread "文件修改后自动载入
set magic
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" 界面设置
"" 在状态栏显示正在输入的命令
"set showcmd
"" 左下角显示当前Vim模式
"set showmode
" 显示行号
set number
"" Statusline
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
"" Always show the status line - use 2 lines for the status bar
"set laststatus=2
" Highlight current line or column
set cursorline
" set cursorcolumn

set shortmess+=c

" 高亮search命中的文本
set hlsearch
set ignorecase
set smartcase

" 代码折叠
set foldenable
set foldmethod=indent
set foldlevel=99

" 缩进配置
set smartindent
set autoindent

" Tab相关
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set wildmenu
set wildmode=list:longest
set ttyfast


" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,ucs-bom,euc-kr,latin1
set helplang=cn
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Tab相关
" Create new tab
nnoremap <leader>nt :tabnew<CR>
" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>


""" Plugin Configures

"" Airline Config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1


"" Vim-gutentags Config 
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"" Async Run Config
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" 设置根目录标志，若当前项目没有git，可以创建一个.root文件夹
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
" 如果使用cmake，设置 F4 更新 MakeFile
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>
" 设置 F5 运行
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" 设置 F6 执行项目测试 （需要make test）
nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
" 设置 F7 编译整个项目
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
" 设置 F8 运行当前项目 （需要make run）
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
" 设置 F9 编译单文件
nnoremap <silent> <F9> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

"" ALE Config
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_completion_enabled = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
"let g:ale_fix_on_save = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'

" 定义跳转错误行快捷键
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

""" NerdTree Configuration
let g:nerdtree_tabs_open_on_gui_startup=0 " Not open NerdTree Automotically when start Vim.
let NERDTreeChDirMode=1
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=25
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.git$']
map <F11> :NERDTreeTabsToggle<CR>
imap <F11> <ESC> :NERDTreeTabsToggle<CR>
" Tagbar
nmap <F12> :TagbarToggle<CR>

""" YCM Config
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""" LeaderF Config
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0}

let g:Lf_NormalMap = {
	\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
	\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
	\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
	\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
	\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
	\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
	\ }

""" Echodoc.vim Config
set cmdheight=2

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

colorscheme molokai
let g:molokai_original=1
let g:rehash256=1
if exists('$TMUX')
    set term=screen-256color
endif
