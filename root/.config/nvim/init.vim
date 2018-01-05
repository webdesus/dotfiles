" ================ Plugins ==================== {{{
call plug#begin( '~/.config/nvim/bundle')

Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'equalsraf/neovim-gui-shim'

call plug#end()
"}}}
" ================ General Config ==================== {{{
set termguicolors
set number                                                                      "Line numbers are good
set cursorline                                                                  "Highlight current line
set ignorecase                                                                  "case insensitive search
set smartcase                                                                   "Smart case search if there is uppercase
set showmatch                                                                   "Highlight matching bracket
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set encoding=utf8
set nowrap                                                                        "Disabled word wrap
set history=500                                                                 "Store lots of :cmdline history
set pumheight=30                                                                "Maximum number of entries in autocomplete popup
set laststatus=0
set noshowmode

syntax on                                                                       "turn on syntax highlighting

silent! colorscheme onedark

" }}}
" ================ Indentation ====================== {{{

set shiftwidth=2
set softtabstop=2
set tabstop=2
set noexpandtab
set smartindent
set nofoldenable
" set colorcolumn=100

" }}}
" ================ Turn Off Swap Files ============== {{{

set noswapfile
set nobackup
set nowb

" }}}
" ================ Custom mappings ======================== {{{
let mapleader=" "

noremap <Leader>o :NERDTreeToggle<CR>
noremap <Leader>w :close<CR>
nmap <Leader>h <C-W>h
nmap <leader>l <C-W>l
nmap <leader>k <C-W>k
nmap <leader>j <C-W>j
map ,v :vsp $MYVIMRC<CR>
map ,V :so %<CR>
nmap <C-c> <S-v>"+y
nmap <C-x> <S-v>"+x

" not jumping only highlight
nnoremap * *N						
" highligth selected 
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Left> :tabprevious<CR>
" }}}

let g:gonvim_draw_tabline = 0

runtime mswin.vim
set clipboard+=unnamedplus
