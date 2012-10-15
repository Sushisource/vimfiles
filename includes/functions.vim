" Toggle highlight search
function! ToggleHLSearch()
    if &hls
        set nohls
    else
        set hls
    endif
endfunction
