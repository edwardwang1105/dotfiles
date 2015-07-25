" --------------------
" winodws
" --------------------
if has('win32') || has('win64')
  autocmd GUIEnter * set transparency=240
  autocmd BufEnter * :syntax sync fromstart
endif

" Maximize gvim window
set lines=80 columns=200

" --------------------
" fonts
" --------------------
if has('unix')
  set guifont=Ricty\ Diminished\ for\ Powerline\ 12
endif
if has('mac')
  set guifont=Ricty\ Diminished\ for\ Powerline:h16
endif
if has('win32') || has('win64')
  set guifont=Ricty\ Diminished\ for\ Powerline:h12
endif

" --------------------
" Color
" --------------------
set t_Co=256

" scheme
let g:molokai_original = 1
colorscheme molokai

" tab
hi SpecialKey guifg=grey20

" eol
hi NonText guifg=grey20

" Split Window
hi VertSplit guifg=#080808 guibg=#080808 gui=bold

" --------------------
" Menu
" --------------------
set guioptions-=T " no tool bar
set guioptions-=m " no menu bar
set guioptions-=r " no right scrollbar
set guioptions-=R " no right scrollbar
set guioptions-=l " no left scrollbar
set guioptions-=L " no left scrollbar

set wildmenu

" --------------------
" Plugin Setting
" --------------------
let g:nerdtree_tabs_open_on_gui_startup=0
