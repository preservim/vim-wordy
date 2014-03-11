" ============================================================================
" File:        autoload/wordy.vim
" Description: autoload script for vim-wordy plugin
" Maintainer:  Reed Esau <github.com/reedes>
" Last Change: January 14, 2014
" License:     The MIT License (MIT)
" ============================================================================

if exists("autoloaded_wordy") | finish | endif
let autoloaded_wordy = 1

function! wordy#init(...) abort
  let l:args = a:0 ? a:1 : {}

  " start by restoring original state
  if exists('b:original_spl')
    if len(b:original_spl) > 0
      exe 'setlocal spelllang=' . b:original_spl
      unlet b:original_spl
      setlocal spell< nospell<
    endif
  endif

  " switch to usage dictionaries, building if needed
  let l:dicts = get(l:args, 'd', [])
  if len(l:dicts)
    let l:dst_paths = []
    " TODO &spelllang)
    let l:lang = get(l:args, 'lang', 'en')
    " TODO &encoding)
    let l:encoding = get(l:args, 'encoding', 'utf-8')
    for l:dict in l:dicts
      let l:data_dir = g:wordy_dir . '/data'
      let l:src_path = l:data_dir . '/' . l:lang . '/' . l:dict . '.dic'
      if filereadable(l:src_path)
        let l:spell_dir = g:wordy_dir . '/spell'
        if !isdirectory(l:spell_dir)
          call mkdir(expand(l:spell_dir), "p")
        endif
        let l:dst_path = l:spell_dir . '/' . l:dict . '.' . l:lang . '.' . l:encoding . '.spl'
        if get(l:args, 'force', 0) ||
         \ !filereadable(l:dst_path) ||
         \ getftime(l:dst_path) < getftime(l:src_path)
          " attempt to (re)build the spell file
          exe 'mkspell! ' . l:dst_path . ' ' . l:src_path
        endif
        if filereadable(l:dst_path)
          call add(l:dst_paths, l:dst_path)
        else
          echohl WarningMsg | echo 'Unable to read target: ' . l:dst_path | echohl NONE
        endif
      else
        echohl WarningMsg | echo 'Unable to read source: ' . l:src_path | echohl NONE
      endif
    endfor
    if len(l:dst_paths) > 0
      let b:original_spl = &spelllang
      exe 'setlocal spelllang=' . l:lang . ',' . join(l:dst_paths, ',')
      setlocal spell
    endif
  endif
endfunction

function! wordy#jump(mode)
  let g:wordy = s:wordy_get(a:mode)
  let l:entry = get(g:wordy#data, g:wordy, [])
  if len(l:entry) > 0
    call wordy#init({ 'd': l:entry[0] })
    echo g:wordy . ': ' . l:entry[1]
  endif
endfunction

function! s:wordy_get(mode)
  let l:avail_count = len(g:wordy#ring)
  let l:new_n = -1
  if a:mode == '#first'
    let l:new_n = 0
  elseif a:mode == '#last'
    let l:new_n = l:avail_count - 1
  elseif a:mode == '#random'
    let l:new_n =
          \ str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
          \ % l:avail_count
  elseif a:mode == '#next' || a:mode == '#previous'
    let l:current_n = index(g:wordy#ring, g:wordy)
    if a:mode == '#next'
      if l:current_n == -1 || l:current_n == l:avail_count - 1
        let l:new_n = 0
      else
        let l:new_n = l:current_n + 1
      endif
    elseif a:mode == '#previous'
      if l:current_n <= 0
        let l:new_n = l:avail_count - 1
      else
        let l:new_n = l:current_n - 1
      endif
    endif
  endif

  if l:new_n == -1
    return a:mode
  else
    return g:wordy#ring[l:new_n]
  endif
endfunction

" vim:ts=2:sw=2:sts=2
