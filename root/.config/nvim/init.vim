" ================ Plugins ==================== {{{
call plug#begin( '~/.config/nvim/bundle')

	Plug 'joshdick/onedark.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'equalsraf/neovim-gui-shim'
	Plug 'jlanzarotta/bufexplorer'
	Plug 'qpkorr/vim-bufkill'
	Plug 'easymotion/vim-easymotion'
	Plug 'tomtom/tcomment_vim' 

	Plug 'vim-airline/vim-airline' 
	Plug 'tpope/vim-fugitive'

	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'sheerun/vim-polyglot'

	" rust
	Plug 'sebastianmarkow/deoplete-rust' 

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
	set nowrap                                                                      "Disabled word wrap
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
	nmap <leader>x :BW<CR>
	" not jumping only highlight
	nnoremap * *N						
	" highligth selected 
	vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>
	nnoremap <C-Right> :tabnext<CR>
	nnoremap <C-Left> :tabprevious<CR>

	nnoremap <Tab> >>
	nnoremap <S-Tab> <<
	vnoremap <Tab> >gv
	vnoremap <S-Tab> <gv
	inoremap <S-Tab> <BS>

" }}}
" ================ Encoding  Menu ======================== {{{
" Свое меню с выбором кодировки по F8
" использ. коммент stasikos отсюда http://habrahabr.ru/blogs/vim/28181/
	set wildmenu
	set wcm=<Tab>
	menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
	menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
	menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
	menu Encoding.utf-8 :e ++enc=utf8 <CR>
	menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
	map <F8> :emenu Encoding.<TAB>
	" Выбор кодировки, в которой сохранять файл -- см. http://konishchevdmitry.blogspot.com/2008/07/howto-vim.html
	set wildmenu
	set wcm=<Tab>
	menu Encoding.Write.utf-8<Tab><S-F7> :set fenc=utf8 <CR>
	menu Encoding.Write.windows-1251<Tab><S-F7> :set fenc=cp1251<CR>
	menu Encoding.Write.koi8-r<Tab><S-F7> :set fenc=koi8-r<CR>
	menu Encoding.Write.cp866<Tab><S-F7> :set fenc=cp866<CR>
	map <F7> :emenu Encoding.Write.<TAB>
" }}}

" ================ Plugins setups ======================== {{{

	let g:EasyMotion_do_mapping = 0																									" Disable default mappings
	nmap s <Plug>(easymotion-overwin-f)
	let g:EasyMotion_smartcase = 1

	let g:deoplete#sources#rust#racer_binary='/home/webdesus/.cargo/bin/racer'
	let g:deoplete#sources#rust#rust_source_path='/home/webdesus/git/rust/src'
	let g:deoplete#sources#rust#show_duplicates=0
	let g:deoplete#auto_completion_start_length=1
	let g:deoplete#enable_camel_case=1
	let g:deoplete#max_list=20
	let g:deoplete#ignore_sources={}
	let g:deoplete#ignore_sources._=['buffer']
	let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
	let g:deoplete#file#enable_buffer_path = 1                                      "Autocomplete files relative to current buffer
	let g:deoplete#tag#cache_limit_size = 10000000                                  "Allow tags file up to ~10 MB

	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme='onedark'

	let g:rustfmt_autosave = 1

" }}}


	let g:gonvim_draw_tabline = 0

	runtime mswin.vim
	set clipboard+=unnamedplus

