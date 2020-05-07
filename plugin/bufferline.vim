" if exists('g:loaded_bufferline') | finish | endif " prevent loading file twice
" let s:save_cpo = &cpo " save user coptions
" set cpo&vim " reset them to defaults

" TODO figure out how to do this directly in lua
function! TabLine() abort
    return luaeval("require'bufferline'.bufferline()")
endfunction

" let &cpo = s:save_cpo " and restore after
" unlet s:save_cpo

let g:loaded_bufferline = 1

function HandleBufferlineClick(minwid, clicks, btn, modifiers) abort
  execute 'buffer '.a:minwid
endfunction

" Setup plugin internals like autocommands
lua require'bufferline'.setup()

set showtabline=2
set tabline=%!TabLine()