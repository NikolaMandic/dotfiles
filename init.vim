"call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')
set termguicolors

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'Lokaltog/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'danro/rename.vim'
Plug 'chrisbra/csv.vim'
Plug 'scrooloose/nerdtree.git'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'git@github.com:leafgarland/typescript-vim.git'
Plug 'git@github.com:PProvost/vim-ps1.git'
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'Shougo/unite.vim'
Plug 'lambdalisue/unite-grep-vcs'
Plug 'airblade/vim-gitgutter'
Plug 'elixir-lang/vim-elixir'
Plug 'ntpeters/vim-better-whitespace'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-fireplace'
Plug 'vim-syntastic/syntastic'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-classpath'
Plug 'clojure-vim/clj-refactor.nvim'
"Plug 'hkupty/acid.nvim'
Plug 'clojure-vim/async-clj-omni'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'snoe/nvim-parinfer.js'
Plug 'ervandew/screen'
Plug 'jpalardy/vim-slime'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
let g:ScreenImpl='Tmux' " I use tmux
"noremap <leader>E :ScreenShell " Open a shell/repl
"vnoremap <leader>e :ScreenSend<CR> " send current visual selection to a shell/repl
"<leader>e :ScreenSend<CR> " send a whole buffer to shell/repl
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
" or maybe...
let g:slime_paste_file = tempname()

"vnoremap  <Leader>e <Esc> <C-v>af
vmap  <Leader>e <Plug>(sexp_outer_list):SlimeSend<CR>
nmap  <Leader>e <c-v><Plug>(sexp_outer_list):SlimeSend<CR>
"
" " Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
" " Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" " On-demand loading
 Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" " Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
" " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
 Plug 'fatih/vim-go', { 'tag': '*' }
"
" " Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }


" Add plugins to &runtimepath
call plug#end()

colorscheme ir_black
syntax on
filetype plugin indent on
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let mapleader=","
map <leader>a :NERDTreeToggle<CR>
nmap <leader>s :w<CR>
nmap <leader>q :q<CR>
nmap <leader>t :tabnew<CR>
vmap <leader>s <Esc><C-s>gv
imap <leader>s <Esc><C-s>
nmap <leader>d :call delete(expand('%'))
nmap <leader>p :call delete(expand('%')) \| bdelete!



vmap <leader>w :s/\%V\(.*\)\%V/"\1"/<CR>
imap <leader>w :s/\%V\(.*\)\%V/"\1"/<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_js_checkers = ['jshint']

set nocompatible
set hidden

nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" size of a hard tabstop
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2
autocmd FileType ruby,javascript,css autocmd BufWritePre <buffer> StripWhitespace


nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set nu
set laststatus=2
set ttimeoutlen=50
nnoremap <Leader>f :Unite -start-insert grep/git:.<CR>
nnoremap <Leader>g :Unite -start-insert grep/git<CR>
set clipboard=unnamedplus
set tabstop=2
set softtabstop=2
" size of an "indent"
set shiftwidth=2
set expandtab
set smarttab
set smartindent
"set clipboard=unnamed
:nmap <leader>l :set invlist<cr>
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>
