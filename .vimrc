"Run Pathogen!
runtime ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
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
set diffexpr=MyDiff()
if has('gui_running')
    set guifont="Menlo"
endif
set shortmess=atI
set helplang=En
set relativenumber
set history=200
set showmatch
set hlsearch
set scrolloff=3
set incsearch
set keymodel=startsel,stopsel
set ruler
set laststatus=2
set selection=exclusive
set selectmode=mouse,key
set wildignore=*.pyc,*.class
set foldmethod=syntax
set foldlevel=99
"Badass tab-completion: 
set wildmenu
set mouse=a
set window=34
set undofile
set encoding=utf-8
set ignorecase
set smartcase
set gdefault
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab autoindent smartindent
set guioptions-=T " Remove toolbar
set guioptions-=m " Remove menu
set guioptions-=e " Remove guitabs
set guioptions+=c " Use console for simple choices
set colorcolumn=85
" ---------------------------------------------------
" Further customizations
" ---------------------------------------------------
colorscheme molokai
syntax on
syntax enable
filetype plugin indent on
au BufNewFile,BufRead *.cfdg setf cfdg
"Run buttons
au FileType python nmap <silent> <F5> :!python %<CR><CR>
"Supertab
set ofu=syntaxcomplete#Complete "By default use syntax files
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
set completeopt=longest,menuone 
"This autohides stupid quickref window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"TagBar settings
let g:tagbar_width=24
"Clojure 
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=10
"Set swapfile directory to somewhere nicer
set directory=~/.vim
set backupdir=~/.vim
set undodir=~/.vim
if has("gui_running") "Big window
    set lines=55 columns=89
end
"Pop in and out of relative mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
"More search range for CPP
let OmniCpp_NamespaceSearch = 1
let OmniCpp_ShowPrototypeInAbbr = 1
set tags+="~/.vim/vimfiles/tags/qt"
"Single Compile
" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_cpp_check_header=0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Powerline
let g:Powerline_symbols='fancy'
" ---------------------------------------------------
" Mappings
" ---------------------------------------------------
noremap <F1> <ESC>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
inoremap jj <ESC>
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
let mapleader = ","
" Some easy file helpers
nmap <leader>t :tabe<Space>
nmap <leader>e :CommandT<CR>
nmap <leader>q :wq<CR>
"Space opens and closes folds
nmap <Space> za
" Tagbar is ,b
nmap <leader>b :TagbarToggle<CR>
" Map leader [ ] to buffer switching
nmap <leader>] :bn<CR>
nmap <leader>[ :bp<CR>
" Window switching
nmap <leader>, <C-W>W
nmap <leader>w :vertical rightb new<CR>
" NERD Tree
nmap <leader>f :NERDTreeToggle<CR>
"Show trailing whitespace 
"Show trailing whitespace 
nmap <silent> <leader>s :set nolist!<CR>
" clear highlighting
nmap <silent> <leader>n :silent :noh<CR>
" rainbow parens
nmap <silent> <leader>p :RainbowParenthesesToggle<CR>
",d is close buffer
nmap <silent> <leader>d :silent :bd<CR>
",l Is buffer list (buffet)
nmap <silent> <leader>l :Bufferlist<CR>
" CTRL-F4 is Close tab
noremap <C-F4> <C-C>:bd
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
" Tab in command mode alternates between brackets
nnoremap <tab> %
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
map <C-F11> :GundoToggle <CR>
" ---------------------------------------------------
" Resizer
" ---------------------------------------------------
if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif
" ---------------------------------------------------
" End Resizer
" ---------------------------------------------------
