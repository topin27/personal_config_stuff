call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'amix/open_file_under_cursor.vim'
Plug 'mhinz/vim-startify'
Plug 'topin27/taskpaper.vim'
Plug 'topin27/JavaImp.vim'
Plug 'skywind3000/vim-preview'
Plug 'ybian/smartim'
Plug 'junegunn/fzf', {'dir': '~/bins/fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
" Plug 'zxqfl/tabnine-vim'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
syntax enable
set nu
set rnu
set ruler
set ai
set hlsearch
set noet
set ts=8
set mouse=a
set ls=2
set conceallevel=0
set wildmenu
set completeopt-=preview

let maplocalleader = ','

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <M-d> <S-Right><Delete>
cnoremap <C-g> <C-c>
cnoremap <C-K> <C-U>
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
nmap <LocalLeader>q :b#<bar>bd#<CR><C-W><C-P>
nmap <LocalLeader>tp :setlocal paste!<cr>
nmap <LocalLeader>s :w<CR>
nmap <F5> :w<CR> :make<Up><CR>
inoremap <C-E> <End>
inoremap <C-A> <Home>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
nnoremap g] g<C-]>
imap <Esc> <Esc><Esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" For NERDTree
let g:NERDTreeIgnore = ['\.pyc$', '\~$'] "ignore files in NERDTree
let g:NERDTreeHighlightCursorline = 1
map <F2> :NERDTreeToggle<CR>

" For tagbar
let g:tagbar_right = 1
let g:tagbar_autofocus = 1
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }
let g:tagbar_type_taskpaper = {
	\ 'ctagstype' : 'taskpaper',
	\ 'kinds' : [
		\ 'p:projects',
	\ ],
	\ 'sort' : 0
\ }
map <F3> :TagbarToggle<CR>

" For fzf
let g:fzf_command_prefix = "Fzf"
nnoremap <silent> <Leader>f :FzfFiles<CR>
nnoremap <silent> <Leader>b :FzfBuffers<CR>
nnoremap <silent> <Leader>w :FzfWindows<CR>
nnoremap <silent> <Leader>jt :FzfTags<CR>
nnoremap <silent> <Leader>ji :FzfBTags<CR>
nnoremap <silent> <Leader>cs :FzfSnippets<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }

" For supertab
let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabContextDefaultCompletionTyper= "<c-p>"

" For Ack.vim
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
" set shellpipe=>  " 解决 ag 的输出结果重定向至 stdout，但可能导致其他插件问题
nnoremap <Leader>ss :Ack! ""<Left>
nnoremap <Leader>s/ :Ack! "" %<Left><Left><Left>
autocmd FileType python nnoremap <LocalLeader>ss :Ack! --python ""<Left>
autocmd FileType c  nnoremap <LocalLeader>ss :Ack! --cc ""<Left>
autocmd FileType cpp  nnoremap <LocalLeader>ss :Ack! --cpp ""<Left>
autocmd FileType ocaml  nnoremap <LocalLeader>ss :Ack! --ocaml ""<Left>
autocmd FileType markdown  nnoremap <LocalLeader>ss :Ack! --markdown ""<Left>
autocmd FileType java  nnoremap <LocalLeader>ss :Ack! --java ""<Left>
nnoremap <Leader>sp :Ack! --python ""<Left>
nnoremap <Leader>sc :Ack! --cc ""<Left>
nnoremap <Leader>sz :Ack! --cpp ""<Left>
nnoremap <Leader>so :Ack! --ocaml ""<Left>
nnoremap <Leader>sm :Ack! --markdown ""<Left>
nnoremap <Leader>sj :Ack! --java ""<Left>

" For ultisnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "yy"
let g:UltiSnipsJumpForwardTrigger = "<C-D>"
let g:UltiSnipsJumpBackwardTrigger = "<C-A>"
" let g:UltiSnipsExpandTrigger = "yy"
" let g:UltiSnipsListSnippets = "yY"
" let g:UltiSnipsJumpForwardTrigger = "YY"
" let g:UltiSnipsJumpBackwardTrigger = "OO"
let g:UltiSnipsSnippetDirectories = [$HOME . '/.vim/plugged/vim-snippets/UltiSnips/']
let g:UltiSnipsSnippetsDir = "~/.vim/snippets/"

" For vim-preview
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPECIFIC PLUGINS & SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ---------
" Taskpaper
" ---------
autocmd FileType taskpaper setlocal ts=4 sts=4 et sw=4
autocmd FileType taskpaper nmap <buffer> <LocalLeader>t <Plug>TaskPaperToggleTodo
autocmd FileType taskpaper nmap <buffer> <LocalLeader>s <Plug>TaskPaperToggleStart
autocmd FileType taskpaper nmap <buffer> <LocalLeader>d <Plug>TaskPaperToggleDone
autocmd FileType taskpaper nmap <buffer> <LocalLeader>c <Plug>TaskPaperToggleCancelled

" -------
" C & C++
" -------

autocmd FileType cpp setlocal ts=2 sts=2 et sw=2

" ----
" Java
" ----

autocmd FileType java setlocal ts=4 sts=4 et sw=4

" For JavaImp
let g:JavaImpPaths =
	\ $HOME . "/.vim/JavaImp/jmplst/"
let g:JavaImpDataDir = $HOME . "/.vim/JavaImp"

" ------
" Python
" ------

autocmd FileType python setlocal ts=4 sts=4 et sw=4

" -----
" OCaml
" -----

" " For ocaml
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
" autocmd FileType ocaml nmap <leader>gd :MerlinLocate<CR>
" autocmd FileType ocaml map <F3> :MerlinOutline<CR>

" --------
" Markdown
" --------

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType markdown setlocal ts=4 sts=4 et sw=4 conceallevel=0
autocmd FileType markdown nmap <LocalLeader>ih :,s/^#\([# ]\+\)/##\1/c<Home>
autocmd FileType markdown nmap <LocalLeader>dh :,s/^##\([# ]\+\)/#\1/c<Home>
