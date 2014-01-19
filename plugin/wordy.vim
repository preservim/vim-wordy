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

command -nargs=0 NoWordy           call wordy#init({})
command -nargs=0 BeingWordy        call wordy#init({ 'd': ['being',] })
command -nargs=0 ColloquialWordy   call wordy#init({ 'd': ['colloquial',] })
command -nargs=0 WeaselWordy       call wordy#init({ 'd': ['weasel',] })
command -nargs=0 IdiomaticWordy    call wordy#init({ 'd': ['idiomatic',] })
command -nargs=0 JargoneseWordy    call wordy#init({ 'd': ['jargonese',] })
command -nargs=0 LazyWordy         call wordy#init({ 'd': ['weak-and-lazy',] })
command -nargs=0 LikeWordy         call wordy#init({ 'd': ['similies',] })
command -nargs=0 OpinionatedWordy  call wordy#init({ 'd': ['opinionated',] })
command -nargs=0 ProblemWordy      call wordy#init({ 'd': ['problematic',] })
command -nargs=0 PuffWordy         call wordy#init({ 'd': ['puffery',] })
command -nargs=0 SaidWordy         call wordy#init({ 'd': ['said-synonyms',] })
command -nargs=0 TimeWordy         call wordy#init({ 'd': ['non-spec-time',] })
command -nargs=0 WordyWordy        call wordy#init({ 'd': ['redundant',] })

command -nargs=0 Wordy call wordy#init({ 'd': [ 'being',
                                              \ 'colloquial',
                                              \ 'idiomatic',
                                              \ 'jargonese',
                                              \ 'manipulative',
                                              \ 'opinionated',
                                              \ 'puffery',
                                              \ 'redundant',
                                              \ 'weak-and-lazy',
                                              \ ])

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:ts=2:sw=2:sts=2
