
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'mtscout6/syntastic-local-eslint.vim', {'for': 'javascript'}

call plug#end()


let mapleader=";"
set guioptions=aegimrLt
set number

noremap <leader>p "+gP 
noremap <leader>y "+y 


set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" NERDTree
map <leader>t :NERDTreeToggle<CR>
map <leader>T :NERDTree %<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"

" vim-jsx
" .jsx extension shan't be required
let g:jsx_ext_required = 0
