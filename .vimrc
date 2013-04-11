"Run Pathogen!
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#incubate()
" Load my other files
source $VIM/vimfiles/includes/functions.vim
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
"NEOCOMPLCACHE ======================================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_auto_select = 0
" Auto completion is for noobs
let g:neocomplcache_disable_auto_complete = 1
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" Ctrl space completion.
inoremap <expr><C-Space> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>"
" Allow accepting results with tab
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Popup closers
inoremap <expr><C-h> neocomplcache#cancel_popup()
inoremap <expr><BS> pumvisible() ? neocomplcache#cancel_popup() : "\<C-h>"
inoremap <expr><ESC> neocomplcache#cancel_popup()."\<C-\>\<C-n>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"NEOCOMPLCACHE ======================================
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
if has("gui_running") "Big window
    set lines=55 columns=89
end
"Pop in and out of relative mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
"More search range for CPP
let OmniCpp_NamespaceSearch = 1
let OmniCpp_ShowPrototypeInAbbr = 1
set tags +=$VIM\vimfiles\tags\qt
"Single Compile
call SingleCompile#SetTemplate('clojure', 'command', 'java')
call SingleCompile#SetTemplate('clojure', 'flags', '-cp E:/libs/clojure/clojure.jar clojure.main %')
call SingleCompile#SetTemplate('clojure', 'run', '')
" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_cpp_check_header=0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Easymotion
let g:EasyMotion_leader_key = '<Space>'
" NERDTree
let g:NERDTreeHijackNetrw = 1
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
noremap <C-Q>	<C-V>
" CTRL-Tab is Next tab
noremap  <C-Tab> :tabn<CR>
inoremap <C-Tab> <C-O>:tabn<CR>
cnoremap <C-Tab> <C-C>:tabn<CR>
onoremap <C-Tab> <C-C>:tabn<CR>
" Make mouse scroll not change cursor pos
inoremap <MouseUp> <C-O><C-Y>
inoremap <MouseDown> <C-O><C-E>
" redef leader
nnoremap \ ,
let mapleader = ","
" Some easy file helpers
nmap <leader>t :tabe<Space>
nmap <leader>e :CommandT<CR>
nmap <leader>q :wq<CR>
" Tagbar is ,b
nmap <leader>b :silent :TagbarToggle<CR>
" Syntastic check with ,c
nmap <leader>c :SyntasticCheck<CR>
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
nmap <silent> <leader>h :noh<CR>
" rainbow parens
nmap <silent> <leader>p :RainbowParenthesesToggle<CR>
",d is close buffer
nmap <silent> <leader>d :silent :bd<CR>
",l Is buffer list (buffet)
nmap <silent> <leader>l :Bufferlist<CR>
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
" Maps f8 to taglist
nnoremap <silent> <F8> :TlistToggle<CR>
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
"Replace selected text
vnoremap <C-r> <Esc>:%s/<c-r>=GetVisual()<cr>/
