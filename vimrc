"Run Pathogen!
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect('bundle/{}')
" Load my other files
" currently resolve doesn't work on windows with mklink based symlinks
if !has("win32")
    let s:current_file=fnamemodify(resolve(expand('<sfile>:p')), ':h')
else
    let s:current_file=expand('<sfile>:p:h')
endif
exec 'source '.s:current_file.'/includes/functions.vim'
" ---------------------------------------------------
" SETS
" ---------------------------------------------------
set nocompatible
set autoread
set tags=tags;
set switchbuf=useopen,usetab
set background=dark
set backspace=indent,eol,start
set hidden
set nobackup nowritebackup
if has("win32")
    set guifont=Consolas:h9
    set guifontwide=MingLiU:h9
elseif has("mac")
    set guifont=Monaco:h10
else
    set guifont=Consolas
endif
set shortmess=atI
set relativenumber
set history=200
set scrolloff=5
set incsearch showmatch hlsearch
set keymodel=startsel,stopsel
set ruler
set ttyfast
set lazyredraw
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
au FileType elm setl tabstop=2 softtabstop=2 shiftwidth=2
set smarttab autoindent smartindent expandtab
set guioptions-=T " Remove toolbar
set guioptions-=m " Remove menu
set guioptions-=e " Remove guitabs
set guioptions+=c " Use console for simple choices
set colorcolumn=80
set formatoptions=tcrqwnl1
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
augroup vimrc
    autocmd!
augroup end
" ---------------------------------------------------
" Further customizations
" ---------------------------------------------------
colorscheme molokai
set t_Co=256
let g:rehash256=1
syntax on
syntax enable
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
au BufNewFile,BufRead *.cfdg setf cfdg
"This autohides stupid quickref window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"TagBar settings
let g:tagbar_width=24
"Clojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=10
"Set swapfile directory to somewhere nicer
if has("win32")
    set directory=$USERPROFILE\.vim\\
    set backupdir=$USERPROFILE\.vim\\
    set undodir=$USERPROFILE\.vim\\
else
    set directory=~/.vim/
    set backupdir=~/.vim
    set undodir=~/.vim/
endif
"Pop in and out of relative mode
autocmd vimrc InsertEnter * :set number
autocmd vimrc InsertLeave * :set relativenumber
" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_cpp_check_header=0
let g:syntastic_python_flake8_args='--ignore=C0103'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['python'] }
let g:erlang_show_errors=0 "Vimerl does this wrong. Syntastic handles it fine.
" Easymotion
let g:EasyMotion_leader_key = ','
" NERDTree
let g:NERDTreeHijackNetrw = 1
" Unite
let g:unite_winheight = 10
" Airline
let g:airline_theme='bubblegum'
let g:airline_detect_whitespace=0
" Neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Enable omni completion.
autocmd vimrc FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd vimrc FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd vimrc FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd vimrc FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd vimrc FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" ---------------------------------------------------
" Mappings
" ---------------------------------------------------
noremap <F1> :e $MYVIMRC <CR>
noremap <F2> :setlocal spell! spelllang=en_us<CR>
noremap <F5> :silent :!p4 open %<CR>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
inoremap jj <C-[>
" Fix stupid yank inconsistency
map Y y$
" CTRL-X and SHIFT-Del are Cut to clipboard
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy to clipboard
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" SHIFT-Insert for pasting from clipboard
map <S-Insert>  "+gP
cmap <S-Insert> <C-R>+
exe 'inoremap <script> <S-Insert>' paste#paste_cmd['i']
exe 'vnoremap <script> <S-Insert>' paste#paste_cmd['v']
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>
" Make mouse scroll not change cursor pos
inoremap <MouseUp> <C-O><C-Y>
inoremap <MouseDown> <C-O><C-E>
" Make v in visual mode use the expandregion plugin
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" LEADER =====================================================================
let mapleader = "\<Space>"
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
" Show trailing whitespace
nmap <silent> <leader>s :set nolist!<CR>
" Delete trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" clear highlighting
nmap <silent> <leader>h :silent :call ToggleHLSearch()<CR>
" rainbow parens
nmap <silent> <leader>p :RainbowParenthesesToggle<CR>
" close buffer
nmap <silent> <leader>d :silent :bd<CR>
" buffer list
nmap <silent> <leader>l :Unite buffer<CR>
" Show me the marks!
nmap <silent> <leader>m :marks<CR>
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
