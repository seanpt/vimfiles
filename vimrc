""""""""""""""""""""""""""""""
" vundle setting
""""""""""""""""""""""""""""""
filetype off        " required!
if has('win32') || has('win64')
  set rtp+=$HOME/vimfiles/vundle/
  call vundle#rc('$HOME/vimfiles/bundle/')
else
  " Usual quickstart instructions
  set rtp+=~/.vim/vundle/
  call vundle#rc()
endif

Bundle 'Shougo/vimproc.vim'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'mhinz/vim-startify'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'terryma/vim-multiple-cursors'
" Bundle 'terryma/vim-expand-region'
Bundle 'tomtom/tcomment_vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'plasticboy/vim-markdown'
" Bundle 'nanotech/jellybeans.vim'
Bundle 'Raimondi/delimitMate'
" Bundle 'nvie/vim-flake8'
Bundle 'antoyo/vim-licenses'
Bundle 'kshenoy/vim-signature'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

filetype plugin indent on    " required!

""""""""""""""""""""""""""""""
" common setting
""""""""""""""""""""""""""""""
set nocompatible
" set ff=unix
set colorcolumn=80
set smartindent
set cursorline 
set ignorecase smartcase
set ruler
" set autochdir
set number
"filetype plugin on "允许插件
"set hlsearch
"set incsearch
set nobackup
set noshowmode
set ffs=unix,dos
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set go=

"Set mapleader
let mapleader = ","

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

inoremap <C-U> <C-G>u<C-U>

set imactivatekey=C-space
inoremap <ESC> <ESC>:set iminsert=2<CR>

"switch buffer
map <F1> :bp!<cr>
map <F2> :bn!<cr>
"switch tabs
nnoremap <leader>=  :tabnext<CR>
nnoremap <leader>-  :tabprev<CR>

"quickfix
nnoremap <F9> :cp!<cr>
nnoremap <F10> :cn!<cr>

"搜索时把当前结果置于屏幕中央并打开折叠
nnoremap n nzzzv
nnoremap N Nzzzv

"map ESC with jj
imap jj <ESC>

"Fast reloading of the .vimrc
nmap <silent> <leader>ss :source $MYVIMRC<cr>
"Fast editing of .vimrc
nmap <silent> <leader>ee :e $MYVIMRC<cr>
"When .vimrc is edited, reload it
autocmd BufEnter * silent! lcd %:p:h

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
autocmd! bufwritepost .vimrc source ~/.vimrc

" Relative numbering
function NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunction

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

""""""""""""""""""""""""""""""
" color and fonts setting
""""""""""""""""""""""""""""""
"Font
if has('win32') || has('win64')
    set guifont=Bitstream_Vera_Sans_Mono:h10.5:cANSI
else
    set guifont=Monaco:h12 
endif
"
"colo
set t_Co=256
syntax enable
if has('gui_running')
    " set background=light
    set background=dark
else
    set background=dark
    let g:solarized_termtrans = 1
endif
let g:solarized_termcolors=256
colorscheme solarized

""""""""""""""""""""""""""""""
" License setting
""""""""""""""""""""""""""""""
let g:licenses_authors_name = 'Xinyu, He <legendmohe@foxmail.com>'
""""""""""""""""""""""""""""""
" Tagbar setting
""""""""""""""""""""""""""""""
nmap <F4> :TagbarToggle<CR>
let g:tagbar_left = 1

""""""""""""""""""""""""""""""
" Ctrlp setting
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>h :CtrlPMRU<cr>
"nnoremap <silent> <leader>p :CtrlP<cr>
let g:ctrlp_map = '<Leader>p'

""""""""""""""""""""""""""""""
" easy-align setting
""""""""""""""""""""""""""""""
" vip<Enter>=
vmap <Enter> <Plug>(EasyAlign)
nnoremap <Leader>a <Plug>(EasyAlign)
""""""""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""""""""
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"
" " These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

""""""""""""""""""""""""""""""
" vim-markdown setting
""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=1

""""""""""""""""""""""""""""""
" neocomplcache setting
""""""""""""""""""""""""""""""
"let g:acp_enableAtStartup              = 0
" Use neocomplete.
"let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3

" Close popup by <Space>.
"  inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space><Space>"
"inoremap <expr><C-g>     neocomplcache#undo_completion()

" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

""""""""""""""""""""""""""""""
" neocomplete setting
""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()

" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

""""""""""""""""""""""""""""""
" Ultisinps setting
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

""""""""""""""""""""""""""""""
" python setting
""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.py,*.pyw setf python
set smartindent " next level indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set foldmethod=indent " fold
set foldlevel=99

let python_space_error_highlight=1

""""""""""""""""""""""""""""""
" Ruby setting
""""""""""""""""""""""""""""""
if has('win32') || has('win64')
    map <F5> <Esc>:w<CR>:silent !start cmd<CR>
else
    execute "map <F5> <Esc>:w<CR>:silent !open -a Terminal " . expand('%:p:h')  ."<CR>"
endif


""""""""""""""""""""""""""""""
" NerdTree setting
""""""""""""""""""""""""""""""
let NERDTreeChDirMode=2
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
let NERDTreeHighlightCursorline = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

map <F3> <plug>NERDTreeTabsToggle<CR>
""""""""""""""""""""""""""""""
" vim-multiple-cursors setting
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Syntastic setting
""""""""""""""""""""""""""""""
let g:syntastic_enable_highlighting=0
let g:syntastic_check_on_open=1
let g:syntastic_mode_map = { 'mode': 'passive',
                               \ 'active_filetypes': ['ruby', 'python'],
                               \ 'passive_filetypes': [] }
""""""""""""""""""""""""""""""
" Task List setting
""""""""""""""""""""""""""""""
map <leader>td <Plug>TaskList

""""""""""""""""""""""""""""""
" ctags setting
""""""""""""""""""""""""""""""

set tags+=tags;

""""""""""""""""""""""""""""""
" airline setting
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_detect_whitespace          = 0 "关闭空白符检测
let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
" let g:airline_theme                      = "bubblegum" "设定主题

""""""""""""""""""""""""""""""
" others setting
""""""""""""""""""""""""""""""
if has('win32') || has('win64')
    source $VIMRUNTIME/mswin.vim 
    behave mswin
endif

" insert word of the line above
inoremap <C-Y> <C-C>:let @z = @"<CR>mz
           \:exec 'normal!' (col('.')==1 && col('$')==1 ? 'k' : 'kl')<CR>
           \:exec (col('.')==col('$') - 1 ? 'let @" = @_' : 'normal! yw')<CR>
           \`zp:let @" = @z<CR>a

""""""""""""""""""""""""""""""
" defult
""""""""""""""""""""""""""""""

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
