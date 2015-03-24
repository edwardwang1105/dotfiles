if has('win32') || has('win64')
  autocmd GUIEnter * set transparency=240
  autocmd GUIEnter * simalt ~x
  autocmd BufEnter * :syntax sync fromstart
  " initial window size
  " set lines=50 columns=100

  " font
  set guifont=MeiryoKe_Console:h11:cSHIFTJIS
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

" TabLine
set showtabline=2
set guioptions-=e
hi TabLineSel guifg=#272822 guibg=#FFAEC9

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
