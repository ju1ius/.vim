
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf',  {'dir': '~/bin/fzf', 'do': './install --all'} | Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'christoomey/vim-system-copy'
" ------- Pairs
" Auto closes pairs (see also the lexima plugin for an alternative)
Plug 'jiangmiao/auto-pairs'
" Surround with Pairs
Plug 'tpope/vim-surround'
" Smart selection inside pairs (vv, then v to expand or Ctrl+Shift+v to
" reduce)
Plug 'gorkunov/smartpairs.vim'

" ----- Colors
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'

" ----- Statusline
Plug 'itchyny/lightline.vim'

" ----- VCS
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" ----- Programming languages related
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
if version >= 800
  Plug 'w0rp/ale'
  Plug 'maximbaz/lightline-ale'
endif

if has('python')
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
endif
Plug 'mattn/emmet-vim'

"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

call plug#end()

set directory=~/.vim/swap//,.
set backupdir=~/.vim/backup//,.

let mapleader=";"
set guioptions=aegimrLt
set guifont=Menlo\ 11
set mouse=a
if version >= 800
  set belloff=all
endif

" Line numbering
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Line wrapping
set nowrap
set breakindent
autocmd FileType markdown,text setlocal wrap
autocmd BufNewFile,BufRead * if empty(&filetype) | setlocal wrap | endif

" Tabs & Whitespace
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
au FileType php,python,c setlocal shiftwidth=4 softtabstop=4 tabstop=4 

noremap <leader>y "+y
noremap <leader>p "+p

" Help File speedups, <enter> to follow tag, backspace for back
au filetype help nnoremap <buffer><cr> <c-]>
au filetype help nnoremap <buffer><bs> <c-T>
au filetype help nnoremap <buffer>q :q<CR>
au filetype help set nonumber
set splitbelow " Split windows, ie Help, make more sense to me below
set splitright " Split windows, ie Help, make more sense to me below
"au filetype help wincmd _ " Maximze the help on open

if has("termguicolors")
  set termguicolors
endif
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:onedark_termcolors=16
colorscheme onedark

" Custom Commands

" Closes all buffers and reopen the current one
command! CloseBuffers :%bd | exe "normal! \<C-O>"


" Lightline
let g:lightline = {
\  'colorscheme': 'onedark',
\}
" maximbaz/lightline-ale
let g:lightline#ale#indicator_ok = '✔'
let g:lightline#ale#indicator_warning = '⚠'
let g:lightline#ale#indicator_error = '❌'
let g:lightline.component_expand = {
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\  'git': 'fugitive#statusline',
\}
let g:lightline.component_type = {
\  'linter_warnings': 'warning',
\  'linter_errors': 'error',
\}
let g:lightline.active = {
\  'left': [
\    [ 'mode', 'paste' ],
\    [ 'readonly', 'filename', 'modified' ],
\    [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
\  ],
\  'right': [
\    [ 'lineinfo' ],
\    [ 'git' ],
\    [ 'filetype' ],
\  ],
\}

" NERDTree
map <leader>t :NERDTreeToggle<CR>
map <leader>T :NERDTree %<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
" Emmet
"let g:user_emmet_leader_key = "<C-l>"

" Use The Silver Searcher if available for ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vim-jsx
" .jsx extension shan't be required
let g:jsx_ext_required = 0

" so Emmet.vim will work in JSX
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': '"',
\  },
\}

" vim-ale
"let g:airline#extensions#ale#enabled = 1
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 0
"let g:ale_fix_on_save = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\}
let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma es5 --no-bracket-spacing'
let g:ale_javascript_prettier_use_local_config = 1

" vim-php
" improves phpdoc highlighting
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

