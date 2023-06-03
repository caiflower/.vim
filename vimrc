" 关闭兼容模式
set nocompatible

call plug#begin()
let g:plug_url_format = 'git@github.com:%s.git'

Plug 'Shougo/unite.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
" Plug 'majutsushi/tagbar'

" thmes
"Plug 'olimorris/onedarkpro.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'preservim/nerdcommenter'

Plug 'preservim/tagbar'

" git 常用命令插件  
Plug 'tpope/vim-fugitive'

Plug 'ludovicchabant/vim-gutentags'

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go', 'tag': '*'}

" 代码自动补全
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}, 'branch': 'release'}

" go代码追踪
Plug 'dgryski/vim-godef'

" git修改了哪些行列的插件
Plug 'airblade/vim-gitgutter'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'honza/vim-snippets'
call plug#end()


" 记录上次打开文件的浏览位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set hlsearch " 高亮显示搜索
set smartcase " 搜索时候忽略大小写
set wildmenu
set number
syntax on
set showmode
set mouse=r
set autoindent
set cursorline
set cursorcolumn
set ignorecase
set updatetime=300
let mapleader=","

set runtimepath+=/Users/lijinlong/.vim/plugged/nerdtree
"快捷键映射
map tr :NERDTreeToggle<CR>
map fc :close<CR>
map fq :quit<CR>
map fs :split<CR>
map fvs :vsplit<CR>
map fw :w<CR>
map ; :

" git 高亮
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }


"前/后标签切换快捷键
nmap <F4> :TagbarToggle f<CR>
nmap <F9> <ESC>:bp<RETURN>
nmap <F10> <ESC>:bn<RETURN>
nmap <F11> <ESC>:tabprevious<RETURN>
nmap <F12> <ESC>:tabnext<RETURN>

"自动补齐成对符号
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

" 默认主题
colorscheme papercolor

call coc#add_extension('coc-highlight','coc-json', 'coc-snippets')

filetype plugin indent on "文件类型识别
 "set modeline "识别文件modeline
 imap <C-l> <Plug>(coc-snippets-expand)
 "跳转到定义位置
 nmap <C-]> <Plug>(coc-definition)
 "跳转到引用位置
 nmap <C-i> <Plug>(coc-references)
 "跳转到引用位置
 nmap <C-s> <Plug>(coc-implementation)
 " 跳转到错误位置
 nmap <leader>e <Plug>(coc-diagnostic-next)

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

let g:Tlist_Ctags_Cmd='/opt/homebrew/Cellar/ctags/5.8_2/bin/ctags'

let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                            ⌘ [espacio]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git status       (Fugitive)                                ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log          (Fugitive)                                ⌘ ,gl',
        \'exe "silent Glog | Unite quickfix"'],
    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
        \'Gblame'],
    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
        \'Gread'],
    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
        \'Gremove'],
    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \]
nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
	\ 'p:package',
	\ 'i:imports:1',
	\ 'c:constants',
	\ 'v:variables',
	\ 't:types',
	\ 'n:interfaces',
	\ 'w:fields',
	\ 'e:embedded',
	\ 'm:methods',
	\ 'r:constructor',
	\ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
	\ 't' : 'ctype',
	\ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
	\ 'ctype' : 't',
	\ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
