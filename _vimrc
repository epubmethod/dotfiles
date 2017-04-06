if !&compatible
  set nocompatible
endif

"reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

"dein settings {{{
  "dein.vim auto install
  let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache'): $XDG_CACHE_HOME
  let s:dein_dir = s:cache_home . '/dein'
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

  if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
  endif

  let &runtimepath = s:dein_repo_dir .",". &runtimepath
  "load plugins
  let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
    if dein#load_state(s:dein_dir)
      call dein#begin(s:dein_dir)
      call dein#load_toml(s:toml_file)
      call dein#end()
      call dein#save_state()
    endif

  "plugins auto install
  if has('vim_starting') && dein#check_install()
    call dein#install()
  endif
"}}}

set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac
set expandtab
set autoindent
set number
set ruler
set wrapscan
set list
:set listchars=tab:»-,trail:-,nbsp:%,eol:↵
set completeopt=menuone
set laststatus=2
set showtabline=2
set t_Co=256
filetype plugin indent on
syntax enable
