set nocompatible              " be iMproved, required
" filetype off                  " required set nowrap	"выключение переноса строк
set number	"нумерация строк
set cursorline "Подсветка текущей строки
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=r  "remove left-hand scroll bar
set backspace=indent,eol,start "чтобы работало нормально с backspace
set ignorecase "Игнорировать регистр букв при поиске
set smartcase "Если искомое выражения содержит символы в верхнем регистре — ищет с учётом регистра, иначе — без учёта
set hlsearch  "Подсветка найденого
"## настройки для работы табов начало
set tabstop=2
set shiftwidth=2
set nosmarttab
set	noexpandtab
" отмена автоподставки в итилисенс
set completeopt=menu,longest

"для производительности выключаем подсветку курсора и уменьшаем просчет цвета
"линий
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256
"## настройки для работы табов конец

" отключаем бэкапы и своп-файлы
set nobackup				 " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile			 " no swap files



" ========== Кодировки ===========
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
" Параметры работы с кодировками см. http://habrahabr.ru/blogs/vim/53435/
" Кодировка терминала, должна совпадать с той, которая используется для вывода в терминал
set termencoding=utf-8
" возможные кодировки файлов и последовательность определения.
set fileencodings=utf8,cp1251,koi8-r,cp866,koi8-u
" Нижеследующее рекомендуется многими
set encoding=utf8
" При прокрутке оставлять шесть экранных строк под и над курсором
set so=5
" ========== Кодировки конец ===========

let mapleader=" "

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/plugged/plug.vim
" call vundle#begin()

call plug#begin('~/vimfiles/bundle')
Plug  'jlanzarotta/bufexplorer'
Plug  'scrooloose/nerdtree'
Plug  'tpope/vim-repeat'
Plug  'ctrlpvim/ctrlp.vim'
Plug  'godlygeek/tabular'
Plug  'othree/html5.vim'
" Plug  'ervandew/supertab'
" Plug  'pangloss/vim-javascript'
Plug  'mattn/emmet-vim'
Plug  'Valloric/MatchTagAlways'
Plug  'joshdick/onedark.vim'
Plug  'vim-airline/vim-airline'
Plug  'qpkorr/vim-bufkill'
Plug  'terryma/vim-multiple-cursors'
" Plug  'webdesus/polymer-ide.vim', { 'do': 'npm install' }
Plug  'SirVer/ultisnips'
Plug  'tomtom/tcomment_vim'
Plug  'vim-syntastic/syntastic'
Plug  'rust-lang/rust.vim'
" Plug  'MattesGroeger/vim-bookmarks'
Plug  'Valloric/YouCompleteMe'
Plug  'easymotion/vim-easymotion'
Plug  'leafgarland/typescript-vim'
" Plug  'Quramy/tsuquyomi'
Plug  'Quramy/vim-js-pretty-template'
Plug  'mhartington/vim-angular2-snippets'
Plug  'Chiel92/vim-autoformat', { 'do': 'npm install -g typescript-formatter' }

"
"
"
" intresting but not using now
" +++++++++++++++++++++++++++++++
" Plugin 'Shougo/vimproc.vim'
" Plugin 'tpope/vim-surround'
" Plugin 'neomake/neomake'
" Plugin 'ternjs/tern_for_vim'
" Plugin 'xolox/vim-shell'
" Plugin 'reedes/vim-lexical'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
" Plugin 'moll/vim-node'
" Plugin 'joonty/vdebug'
" Plugin 'tpope/vim-ragtag'
" Plugin 'mbbill/undotree'
" Plugin 'dyng/ctrlsf.vim'
" Plugin 'tpope/vim-dispatch'
" Plugin 'majutsushi/tagbar'
" Plugin 'tpope/vim-unimpaired'
" ++++++++++++++++++++++++++++++++++++
call plug#end()


" call vundle#end()            " required
" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Theme settings begin

" syntax on
colorscheme onedark

"Syntastic settings begin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map={'mode': 'passive'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" let g:syntastic_html_checkers = ['eslint', 'polylint']
let g:syntastic_html_checkers = [ 'polylint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_rust_checkers = ['rustc']
"Syntastic settings end



let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

"Theme settings end

"gvim settings begin




if has("gui_running")
	if has("gui_gtk2")
		set guifont=Inconsolata\ 12
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		set guifont=Consolas:h11:cDEFAULT
	endif
endif
"gvim settings end


" ##map start ##
noremap <Leader>o :NERDTreeToggle<CR>
" noremap <Leader>j <C-W>w
noremap <Leader>w :close<CR>
nmap <Leader>h <C-W>h
nmap <leader>l <C-W>l
nmap <leader>k <C-W>k
nmap <leader>j <C-W>j
command -nargs=1 Nerd NERDTree <args>
" map <c-f4> :call SmartExit()<CR>
map <c-f4> :BW<CR>
"по звездочке не прыгаем на следующие значение, только подсвечиваем найденое
nnoremap * *N
" в визуальном режиме по команде * подсвечивать выделение
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Left> :tabprevious<CR>

"автокомплит
" :imap <C-Space> <C-X><C-O>

nnoremap ÷ <C-W>

"navigation begin
nnoremap @ :TernDef<cr>
"navigation end

"windows keyboards begin
inoremap <c-z> <esc>u<cr>
noremap <c-z> u<cr>

inoremap <c-y> <esc>^R<cr>
nnoremap <c-y> <c-R><cr>

inoremap <c-s> <esc>:w<cr>
nnoremap <c-s> :w<cr>

inoremap <c-a> <esc>gg"*yG$<cr>
nnoremap <c-a> $ggvG<cr>



autocmd VimEnter * vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <Bs>

:behave mswin
:set clipboard=unnamedplus
" :vmap <C-c> <C-Insert>
" :imap <C-c> <esc><S-v><C-Insert>
:nmap <C-c> <S-v>"+y
:imap <C-c> "+y
:vmap <C-c> "+y


:nmap <C-x> <S-v>"+_d
:imap <C-x> "+_d
:vmap <C-x> "_d

" autocmd VimEnter * imap <C-v> <S-Insert>
" :vmap <C-v> <C-g><S-Insert>
:nmap <C-v> i<S-Insert><esc>
:imap <C-v> <S-Insert>
:vmap <C-v> "_dP
" :nmap <C-v> "p
xnoremap p "_dP

" чтобы не затерало буфер удаляемым значением
:noremap x "_x\"

"windows keyboards end


"map end

"russian keyboard begin

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"russian keyboard end
"


" ## Edit .vimrc start ##

map ,v :vsp $MYVIMRC<CR>
map ,V :so %<CR>

" ## Edit .vimrc end ##
"



inoremap <A-c> *i_CTRL-X_CTRL-O


autocmd Filetype html nmap <F12> :call polymer_ide#GoToDefinition(':vs')<CR>
autocmd Filetype html imap <F12> :call polymer_ide#GoToDefinition(':vs')<CR>


autocmd Filetype html nmap <F1> :call polymer_ide#ShowDocumentation()<CR>
autocmd Filetype html imap <F1> :call polymer_ide#ShowDocumentation()<CR>

autocmd Filetype html nmap <F2> :call polymer_ide#ShowError(line('.'))<CR>
autocmd Filetype html imap <F2> :call polymer_ide#ShowError(line('.'))<CR>

autocmd Filetype html nmap <C-A-DOWN> :call polymer_ide#NextError()<CR>
autocmd Filetype html imap <C-A-DOWN> :call polymer_ide#NextError()<CR>

autocmd Filetype html nmap <C-A-UP> :call polymer_ide#PreviousError()<CR>
autocmd Filetype html imap <C-A-UP> :call polymer_ide#PreviousError()<CR>

let g:polymer_ide#on_buffer_text_change = 1
let g:polymer_ide#use_snippets = 1
let g:polymer_ide#use_syntastic = 0


let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<s-b>"

let g:rustfmt_autosave = 1


let g:bookmark_no_default_key_mappings = 1
nmap mm :BookmarkToggle<CR>
nmap mj :BookmarkNext<CR>
nmap mk :BookmarkPrev<CR>

let g:ycm_rust_src_path = 'c:\Git\rust-master\src'


let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1

autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>


autocmd FileType typescript  JsPreTmpl html
autocmd FileType typescript syn clear foldBraces " For leafgarland/typescript-vim users only. Please see #1 for details.
au BufReadPost *.cshtml set syntax=html

augroup FileSave
	autocmd FileType typescript
				\ autocmd! FileSave BufWrite * :Autoformat
augroup END
