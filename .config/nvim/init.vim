"All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" GENERAL {{{

"  Line numbering
set nu
set relativenumber

"  Search
" set hlsearch
set incsearch
set smartcase

"  Identation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set noexpandtab

"  Listchars
set listchars=tab:\|-,trail:@

"  Syntax
syntax off
set synmaxcol=80

"  Status stuff
set laststatus=2
set ruler
set showcmd

"  Wildmenu
set wildmenu
set wildmode=longest,full

"  Offsets
set scrolloff=6
set sidescroll=1
set sidescrolloff=6

"  Folding
set foldmethod=syntax
set foldcolumn=0

" Completion
set dictionary=/usr/share/dict/words

" Regex
set magic

"  Clean backups
set nowritebackup
" set nobackup
" set backupdir=~/.config/nvim/backup
" MOVED TO NVIM DUE TO DEPRECIATION
" set directory=~/.config/nvimtmp
" set viminfo='100,<50,s10,h,n$HOME/.config/nvim/.nviminfo
set history=256
" }}}
" INTERFACE {{{

" Formatting
call matchadd('ColorColumn', '\%81v', 100)

"  Terminal

" force 256 colors
set t_Co=256
" set colorscheme to tweaked smyck
" MOVED TO MISC TO OVERWRITE WEIRDNESS WITH VIM-PLUG

"  Gui

" gui options
if has("gui_running")
	set guifont=Terminus\ 8
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	set guiheadroom=0

	colorscheme molokai
endif
" }}}
" NATIVE BINDINGS {{{

"  Command maps

" w!! to write as superuser
cmap w!! w !sudo tee % >/dev/null

"  Key maps

" remap the leader key
let g:mapleader="\<space>"

" move between splits
" nmap <C-h> <C-w>h
" nmap <C-j> <C-w>j
" nmap <C-k> <C-w>k
" nmap <C-l> <C-w>l

" quick command things
nmap <Leader>x :q<CR>
nmap <Leader>c :close<CR>
nmap <Leader>z :write<CR>
nmap <Leader>th :set hlsearch!<CR>
nmap <Leader>tn :set number!<CR>
nmap <Leader>tr :set relativenumber!<CR>
nmap <Leader>tl :set list!<CR>
" }}}
" VARIABLES {{{
" let g:python3_host_prog = '/usr/bin/python3'
" }}}
" PLUGINS {{{

" Vundle
call plug#begin('~/.config/nvim/bundle')
" Plug 'severin-lemaignan/vim-minimap'
" Plug 'tomtom/tcomment_vim'
" Plugin 'sirver/UltiSnips'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'Shougo/unite.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-plug'
Plug 'ledger/vim-ledger'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
call plug#end()

" QuickRun
" temporary
nmap <Leader>r :QuickRun<CR>

" Netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_winsize=30

nmap <Leader>e :Lexplore<CR>
" Unite
let g:unite_source_history_yank_enable=1

nmap <Leader>p :Unite -start-insert file_rec/neovim<CR>
nmap <Leader>o :Unite -start-insert file<CR>
nmap <Leader>i :Unite -start-insert buffer<CR>
nmap <Leader>u :Unite -start-insert register<CR>

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
	imap <buffer> <C-j>   <Plug>(unite_select_next_line)
	imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" Goyo
nmap <Leader>g :Goyo<CR>

function! s:goyo_enter()
	set scrolloff=999
endfunction
function! s:goyo_leave()
	set scrolloff=6
	colorscheme usmyck
endfunction

autocmd User GoyoEnter nested call <SID>goyo_enter()
autocmd User GoyoLeave nested call <SID>goyo_leave()
" }}}
" FUNCTIONS {{{

" function! TermRun()
" 	:vsp term://env &filename %
" endfunction

" function Aesthetic()
" 	set laststatus=0
" 	set noruler
" 	set nonumber
" 	set norelativenumber
" endfunction

" }}}
" NVIM {{{
if has("nvim")
	" terminal emulator escape
	tnoremap <Esc> <C-\><C-n>
	" shada
	set directory=~/.config/nvim/swap//
	set viminfo='100,<50,s10,h,n$HOME/.config/nvim/nvim.shada
endif
" }}}
" MISC {{{
colorscheme usmyck
syntax off
" }}}
" vim: fdm=marker syntax=vim
