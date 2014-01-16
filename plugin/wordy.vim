" =============================================================================
" File:        plugin/wordy.vim
" Description: Usage support for the Vim text editor
" Maintainer:  Reed Esau <github.com/reedes>
" Last Change: January 14, 2014
" License:     The MIT License (MIT)
" =============================================================================

if exists('g:loaded_wordy') || &cp | finish | endif
let g:loaded_wordy = 1

" Save 'cpoptions' and set Vim default to enable line continuations.
let s:save_cpo = &cpo
set cpo&vim

" need directory to manage spell files
let g:wordy_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

command -nargs=0 NoWordy         call wordy#init({})
command -nargs=0 BeingWordy      call wordy#init({ 'd': ['tobe',] })
command -nargs=0 ColloquialWordy call wordy#init({ 'd': ['colq',] })
command -nargs=0 CredibleWordy   call wordy#init({ 'd': ['cred',] })
command -nargs=0 EditorialWordy  call wordy#init({ 'd': ['edit',] })
command -nargs=0 IdiomaticWordy  call wordy#init({ 'd': ['idim',] })
command -nargs=0 JargonWordy     call wordy#init({ 'd': ['busi',] })
command -nargs=0 ProblemWordy    call wordy#init({ 'd': ['prob',] })
command -nargs=0 PufferyWordy    call wordy#init({ 'd': ['puff',] })
command -nargs=0 WordyWordy      call wordy#init({ 'd': ['redu',] })
command -nargs=0 SaidWordy       call wordy#init({ 'd': ['said',] })
command -nargs=0 SimileWordy     call wordy#init({ 'd': ['simi',] })
command -nargs=0 TimeWordy       call wordy#init({ 'd': ['time',] })
command -nargs=0 WeakWordy       call wordy#init({ 'd': ['weak',] })

command -nargs=0 Wordy           call wordy#init({ 'd': ['tobe', 'colq', 'cred', 'edit',
                                                        \'idim', 'busi', 'prob', 'puff',
                                                        \'redu', 'simi', 'time', 'weak', ]})

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:ts=2:sw=2:sts=2
