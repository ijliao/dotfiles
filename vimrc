" Common settings here.

set nocompatible
set magic
syntax on
set nobackup

" enable filetype detection
filetype on
filetype plugin on
filetype indent on

set tabstop=4
set shiftwidth=4
set expandtab

set nofoldenable

packadd minpac

if !exists('g:loaded_minpac')
  " minpac is not available.

  " Settings for plugin-less environment.

else
  " minpac is available.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('altercation/vim-colors-solarized')
  call minpac#add('ntpeters/vim-better-whitespace')
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('nathangrigg/vim-beancount')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('sheerun/vim-polyglot')

  " Plugin settings here.

  " solarized
  let g:solarized_termcolors=256

  set background=dark

  try
    colorscheme solarized
  catch
  endtry

  " white space
  let g:better_whitespace_enabled=1
  let g:strip_whitespace_on_save=1
  let g:strip_whitespace_confirm=0
  let g:strip_whitelines_at_eof=1

  " easy align
  vnoremap <silent> <Enter> :EasyAlign<Enter>

  " beancount
  let b:beancount_root = '~/beancount/main.bean'
  autocmd FileType beancount inoremap . .<C-O>:AlignCommodity<CR>
  autocmd FileType beancount inoremap <Tab> <c-x><c-o>
endif
