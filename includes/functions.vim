" Escape special characters in a string for exact matching
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
    let string=a:string
    " Escape regex characters
    let string = escape(string, '^$.*\/~[]')
    " Escape the line endings
    let string = substitute(string, '\n', '\\n', 'g')
    return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
    " Save the current register and clipboard
    let reg_save = getreg('"')
    let regtype_save = getregtype('"')
    let cb_save = &clipboard
    set clipboard&

    " Put the current visual selection in the " register
    normal! ""gvy
    let selection = getreg('"')

    " Put the saved registers and clipboards back
    call setreg('"', reg_save, regtype_save)
    let &clipboard = cb_save

    "Escape any special characters in the selection
    let escaped_selection = EscapeString(selection)

    return escaped_selection
endfunction

" Diff current buffer against saved version of file
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Toggle highlight search
function! ToggleHLSearch()
    if &hls
        set nohls
    else
        set hls
    endif
endfunction

" Statusline modifications, added Fugitive Status Line & Syntastic Error Message 
let g:last_mode = ''
function! Mode()
  let l:mode = mode()

  if l:mode !=# g:last_mode
    let g:last_mode = l:mode

    hi User2 guifg=#455354  guibg=#dfff00 gui=BOLD ctermfg=22 ctermbg=190 cterm=BOLD
    hi User3 guifg=#FFFFFF guibg=#455354 ctermfg=255 ctermbg=241
    hi User4 guifg=#455354 guibg=#333333 ctermfg=241 ctermbg=234
    hi User5 guifg=#4e4e4e guibg=#FFFFFF gui=bold ctermfg=239 ctermbg=255 cterm=bold
    hi User6 guifg=#FFFFFF guibg=#8a8a8a ctermfg=255 ctermbg=245
    hi User7 guifg=#455354  guibg=#8a8a8a gui=bold ctermfg=226 ctermbg=245 cterm=bold
    hi User8 guifg=#8a8a8a guibg=#455354 ctermfg=245 ctermbg=241

    if l:mode ==# 'n'
      hi User3 guifg=#dfff00 ctermfg=190
    elseif l:mode ==# "i"
      hi User2 guifg=#005fff guibg=#FFFFFF ctermfg=27 ctermbg=255
      hi User3 guifg=#FFFFFF ctermfg=255
    elseif l:mode ==# "R"
      hi User2 guifg=#FFFFFF guibg=#df0000 ctermfg=255 ctermbg=160
      hi User3 guifg=#df0000 ctermfg=160
    elseif l:mode ==? "v" || l:mode ==# ""
      hi User2 guifg=#4e4e4e guibg=#ffaf00 ctermfg=239 ctermbg=214
      hi User3 guifg=#ffaf00 ctermfg=214
    endif
  endif 

  if l:mode ==# "n"
    return "  NORMAL "
  elseif l:mode ==# "i"
    return "  INSERT "
  elseif l:mode ==# "R"
    return "  REPLACE "
  elseif l:mode ==# "v"
    return "  VISUAL "
  elseif l:mode ==# "V"
    return "  V·LINE "
  elseif l:mode ==# ""
    return "  V·BLOCK "
  else
    return l:mode
  endif
endfunction

set statusline=%2*%{Mode()}%3*⮀%1*
set statusline+=%#StatusLine#
set statusline+=%{strlen(fugitive#statusline())>0?'\ ⭠\ ':''}
set statusline+=%{matchstr(fugitive#statusline(),'(\\zs.*\\ze)')}
set statusline+=%{strlen(fugitive#statusline())>0?'\ \ ⮁\ ':'\ '}
set statusline+=%f\ %{&ro?'⭤':''}%{&mod?'+':''}%<
set statusline+=%4*⮀
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%=
set statusline+=%4*⮂
set statusline+=%#StatusLine#
set statusline+=\ %{strlen(&fileformat)>0?&fileformat.'\ ⮃\ ':''}
set statusline+=%{strlen(&fileencoding)>0?&fileencoding.'\ ⮃\ ':''}
set statusline+=%{strlen(&filetype)>0?&filetype:''}
set statusline+=\ %8*⮂
set statusline+=%7*\ %p%%\ 
set statusline+=%6*⮂%5*⭡\ \ %l:%c\ 
