" --------------------
" Basic
" --------------------
set nobackup
set noswapfile
set noundofile
set mouse=a         " enable mouse
set lines=50 columns=100
set nowrap
set visualbell t_vb=
set novisualbell

" --------------------
" Display
" --------------------
set number          " Show colum number
set showmatch       " Highlight match braces
"set cursorline      " Highlight current line
set hlsearch        " Highlight search word
set list            " Show unvisible characters
set listchars=tab:>.,trail:.,nbsp:%,extends:>,precedes:<,eol:<

" --------------------
" Syntax
" --------------------
" md as markdown, instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" Disable highlight italic in Markdown
autocmd FileType markdown hi! def link markdownItalic LineNr

" --------------------
" Indent
" --------------------
set autoindent
set smartindent
set expandtab       " Change tab to space
set tabstop=2 softtabstop=0 shiftwidth=2    " tab width

" --------------------
" Encoding
" --------------------
set encoding=utf-8
scriptencoding utf-8

" --------------------
" Key Binding
" --------------------
let mapleader=","

" tabLine
nnoremap <C-Tab>    :tabn<CR>
nnoremap <S-C-Tab>  :tabp<CR>
nnoremap tc         :tablast<bar> tabnew<CR>
nnoremap tx         :tabclose<CR>

" split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" search
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" disable arrow key
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Clipboard
vmap <C-c> "+y
imap <C-v> <esc>"+pa

" QuickFix
nnoremap [q :cprevious<CR>   " go to prev
nnoremap ]q :cnext<CR>       " go to next
nnoremap [Q :<C-u>cfirst<CR> " go to first
nnoremap ]Q :<C-u>clast<CR>  " go to last

" --------------------
" Plugin
" --------------------
set nocompatible
filetype off
if has('unix')
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif

if has('win32') || has('win64')
  set rtp+=~/.vim/bundle/Vundle.vim
  let path='~/.vim/bundle'
  call vundle#begin(path)
endif

Plugin 'gmarik/Vundle.vim'
" Syntax & Schemes
Plugin 'rickharris/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'plasticboy/vim-markdown'
" Coding
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" IDE features
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
" Fast coding
Plugin 'Shougo/neocomplete'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'junegunn/vim-easy-align'
" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'scrooloose/syntastic'
" Powershell
Plugin 'PProvost/vim-ps1'
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" Ohters
"Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on

" --------------------
" Plugin Setting (NEARDTree)
" --------------------
" NERDTree & NERDTree tabs
nnoremap <silent> <C-e>     :NERDTreeTabsToggle<CR>

let NERDTreeDirArrows=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif      " auto close NERDTree

" --------------------
" Plugin Setting (ctrlp)
" --------------------
let g:ctrlp_open_new_file='t'
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$
  \ |(node_modules|bower_components)',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

" --------------------
" Plugin Setting (neocomplete)
" --------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" --------------------
" Plugin Setting (ultisnips)
" --------------------
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" --------------------
" Plugin Setting (syntastic)
" --------------------
let g:syntastic_auto_loc_list=1

" --------------------
" Plugin Setting (easymotion)
" --------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" --------------------
" Plugin Setting (easy align)
" --------------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" --------------------
" airline
" --------------------
" tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" symbols
let g:Powerline_symbols = 'fancy'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮀'
