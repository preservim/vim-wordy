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

" vim:ts=2:sw=2:sts=2
