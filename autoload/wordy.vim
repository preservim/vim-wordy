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
  let l:d = get(l:args, 'd', [])   " may be string or list
  let l:dicts = (type(l:d) == type([])) ? l:d : [l:d]
  let l:dst_paths = []
  " TODO &spelllang)
  let l:lang = get(l:args, 'lang', 'en')
  " TODO &encoding)
  let l:encoding = get(l:args, 'encoding', 'utf-8')
  for l:dict in l:dicts
    let l:data_dir = g:wordy_dir . '/data'
    let l:src_path = l:data_dir . '/' . l:lang . '/' . l:dict . '.dic'
    if filereadable(l:src_path)
      if has('nvim')
        let l:rare_path = l:src_path . '.rare'
        if !filereadable(l:rare_path) ||
          \ getftime(l:rare_path) < getftime(l:src_path)
          " Dynamically convert SpellBad words into SpellRare words under NeoVim.
          " See issue 15 for details: https://github.com/reedes/vim-wordy/pull/15
          let l:rare_dic = map(readfile(l:src_path), "substitute(v:val, '!$', '?', '')")
          call writefile(l:rare_dic, l:rare_path)
        endif
        let l:src_path = l:rare_path
      endif

      let l:spell_dir = g:wordy_dir . '/spell'
      if !isdirectory(l:spell_dir)
        call mkdir(expand(l:spell_dir), "p")
      endif
      " The dict name is the 'language' part of the filename
      let l:dst_path = l:spell_dir . '/' . l:dict . '.' . l:encoding . '.spl'
      if get(l:args, 'force', 0) ||
        \ !filereadable(l:dst_path) ||
        \ getftime(l:dst_path) < getftime(l:src_path)
        " attempt to (re)build the spell file
        exe 'mkspell! ' . l:dst_path . ' ' . l:src_path
      endif
      if filereadable(l:dst_path)
        call add(l:dst_paths, l:dst_path)
      else
        let l:msg = 'Unable to read target: ' . l:dst_path
      endif
    else
      let l:msg = 'Unable to read source: ' . l:src_path
    endif
  endfor

  let l:prefix = 'wordy: '
  if len(l:dst_paths) > 0
    let b:original_spl = &spelllang
    " vim looks up the files in the ./spell/ directory using spell-load (see
    " the vim docs) so full paths are not allowed.
    exe 'setlocal spelllang=' . l:lang . ',' . join(l:dicts, ',')
    setlocal spell

    " the magic numbers derived empirically with MacVim
    " docs for rulerformat say 'The default ruler width is 17 characters'
    let l:msg = l:prefix . join(l:dicts, ', ')
    let l:max_len = &columns - strlen(l:prefix) - 5 - (&ruler ? 18 : 0)
    if strlen(l:msg) > l:max_len
      let l:msg = strpart(l:msg, 0, l:max_len-3) . '...'
    endif
  else
    let l:msg = l:prefix . 'off'
  endif
  echohl ModeMsg | echo l:msg | echohl NONE
endfunction

function! wordy#jump(mode)
  " mode=1  next in ring
  " mode=-1 prev in ring
  let l:avail_count = len(g:wordy#ring)
  if l:avail_count == 0 | return | endif
  " if -1, ring navigation not initialized; start at begin or end
  " Example with avail_count=3
  " ((-1 + 3 + 1 + 2) % 4) - 1 => 0
  " (( 0 + 3 + 1 + 2) % 4) - 1 => 1
  " (( 1 + 3 + 1 + 2) % 4) - 1 => 2
  " (( 2 + 3 + 1 + 2) % 4) - 1 => -1   NoWordy
  " ((-1 + 3 - 1 + 2) % 4) - 1 => 2
  " (( 0 + 3 - 1 + 2) % 4) - 1 => -1   NoWordy
  " (( 1 + 3 - 1 + 2) % 4) - 1 => 0
  " (( 2 + 3 - 1 + 2) % 4) - 1 => 1
  let g:wordy_ring_index =
    \ ((g:wordy_ring_index + l:avail_count + a:mode + 2)
    \   % (l:avail_count + 1)) - 1
  if g:wordy_ring_index == -1
    call wordy#init({})       " NoWordy
  else
    call wordy#init({ 'd': g:wordy#ring[ g:wordy_ring_index ]})
  endif
endfunction

" Code from bairui@#vim.freenode
" https://gist.github.com/3322468
function! wordy#flatten(list)
  let val = []
  for elem in a:list
    if type(elem) == type([])
      call extend(val, wordy#flatten(elem))
    else
      call add(val, elem)
    endif
    unlet elem
  endfor
  return val
endfunction

" vim:ts=2:sw=2:sts=2
