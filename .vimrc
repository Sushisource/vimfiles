"Run Pathogen!
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#incubate()
" Load my other files
source $VIM/vimfiles/includes/functions.vim
source $VIM/vimfiles/includes/resizer.vim
" ---------------------------------------------------
" SETS
" ---------------------------------------------------
set nocompatible
set autoread
set switchbuf=useopen,usetab
set background=dark
set backspace=indent,eol,start
set hidden
set nobackup nowritebackup
set guifont=Consolas:h9
set shortmess=atI
set relativenumber
set history=200
set scrolloff=5
set incsearch showmatch hlsearch
set keymodel=startsel,stopsel
set ruler
set laststatus=2
set selection=exclusive
set selectmode=mouse,key
set wildignore=*.pyc,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set foldmethod=syntax
set foldlevel=99
set wildmenu
set mouse=ar
set window=34
set undofile
set encoding=utf-8
set ignorecase
set smartcase
set gdefault
set tabstop=4 softtabstop=4 shiftwidth=4
set smarttab autoindent smartindent expandtab 
set guioptions-=T " Remove toolbar
set guioptions-=m " Remove menu
set guioptions-=e " Remove guitabs
set guioptions+=c " Use console for simple choices
set colorcolumn=80
set formatoptions=tcrqwnl1
" ---------------------------------------------------
" Further customizations
" ---------------------------------------------------
colorscheme molokai
syntax on
syntax enable
filetype plugin indent on
au BufNewFile,BufRead *.cfdg setf cfdg
"This autohides stupid quickref window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"TagBar settings
let g:tagbar_width=24
"Clojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=10
"Set swapfile directory to somewhere nicer
set directory=%USERPROFILE%\.vim\\
set backupdir=%USERPROFILE%\.vim\\
set undodir=%USERPROFILE%\.vim\\
"Pop in and out of relative mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_cpp_check_header=0
let g:syntastic_python_flake8_args='--ignore=C0103'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['python'] }
let g:erlang_show_errors=0 "Vimerl does this wrong. Syntastic handles it fine.
" Easymotion
let g:EasyMotion_leader_key = '<Space>'
" NERDTree
let g:NERDTreeHijackNetrw = 1
" Unite
let g:unite_winheight = 10
" Airline
let g:airline_theme='bubblegum'
let g:airline_detect_whitespace=0
" ---------------------------------------------------
" Mappings
" ---------------------------------------------------
noremap <F1> :e $MYVIMRC <CR>
noremap <F5> :silent :!p4 open %<CR>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
inoremap jj <C-[>
" Fix stupid yank inconsistency
map Y y$
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
map <C-V>       "+gp
map <S-Insert>  "+gP
cmap <C-V>      <C-R>+
cmap <S-Insert> <C-R>+
" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert>	<C-V>
vmap <S-Insert>	<C-V>
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>
" Make mouse scroll not change cursor pos
inoremap <MouseUp> <C-O><C-Y>
inoremap <MouseDown> <C-O><C-E>
" LEADER =====================================================================
nnoremap \ ,
let mapleader = ","
" Some easy file helpers
nmap <leader>t :tabe<Space>
nmap <leader>e :Unite -start-insert file<CR>
nmap <leader>E :Unite -start-insert file_rec<CR>
nmap <leader>q :wq<CR>
" Tagbar is ,b
nmap <leader>b :silent :TagbarToggle<CR>
" Syntastic check with ,c
nmap <leader>c :SyntasticCheck<CR>
" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>
" Window switching
nmap <leader>, <C-W>W
nmap <leader>w :vertical rightb new<CR>
" NERD Tree
nmap <leader>f :NERDTreeToggle<CR>
"Show trailing whitespace
nmap <silent> <leader>s :set nolist!<CR>
"Delete trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" clear highlighting
nmap <silent> <leader>h :silent :call ToggleHLSearch()<CR>
" rainbow parens
nmap <silent> <leader>p :RainbowParenthesesToggle<CR>
",d is close buffer
nmap <silent> <leader>d :silent :bd<CR>
",l Is buffer list (buffet)
nmap <silent> <leader>l :Unite buffer<CR>
"Show me the marks!
nmap <silent> <leader>m :marks<CR>
"Replace selected text
vnoremap <leader>r <Esc>:%s/<c-r>=GetVisual()<cr>/
" Open explorer window at file locaiton
nmap <silent> <leader>x :Start explorer %:h<CR>
nmap <silent> <leader>z :Start cmd %:h<CR>
" LEADER =====================================================================
" CTRL-A selects all
map <C-A> ggVG
" Use CTRL-S for saving, also in Insert mode
noremap <C-S>   :update<CR>
vnoremap <C-S>	<C-C>:update<CR>
inoremap <C-S>	<C-O>:update<CR>
" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u
" Backspace deletes stuff in visual mode
vnoremap <BS> d
" Add scroll jumping
nnoremap J jjjzz
nnoremap K kkkzz
nnoremap L <end>
nnoremap H <home>
" better regexes
nnoremap / /\v
vnoremap / /\v
" Some nice indet shortcuts
inoremap <C-Right> <C-C>>>i
inoremap <C-Left> <C-C><<i
"Ctags generation
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"Gundo
map <C-F11> :silent :GundoToggle <CR>
"Make arrow keys move around windows
nnoremap <left> <C-W><left>
nnoremap <right> <C-W><right>
