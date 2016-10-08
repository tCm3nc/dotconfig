" ~/.vimrc		-> linux $VIM/.vimrc	-> win
"
" Archivo de configuración del editor VIM (er mejo!)
"
" Trato que funcione tanto en WIN (con gvim) como en LINUX (vim y gvim)
" Configuración ontenida de W0ng -> https://github.com/w0ng
"
" Vicente Gimeno Morales - E7 Version 2.8 - 16 sep 2015
"======================================================================#
"
" Compability {{{
" -----------------------------------------------------------------------------
"
set nocompatible		" use vim defaults instead of vi
set encoding=utf-8		" always encode in utf

"}}}
" Vim Plugins {{{
" -----------------------------------------------------------------------------
"
" Brief help
" :PluginList			- lists configured plugins
" :PluginInstall		- installs plugins
" :PluginUpdate			- Update Plugins
" :PluginSearch foo		- searches for foo; append `!` to refresh local cache
" :PluginClean			- confirms removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	"Put your non-Plugin stuff after this line
	"Plugin 'Shougo/neocomplete'				" Automatic keyword completion
	"Plugin 'Shougo/unite.vim'					" Find files and buffers using ag
	"Plugin 'Shougo/vimfiler.vim'				" File Explorer :VimFiler
	Plugin 'jlanzarotta/bufexplorer'			" Buffer Explorer :BufExplore
	Plugin 'godlygeek/tabular'					" Text alignment
	Plugin 'majutsushi/tagbar'					" Display tags in a window
	"Plugin 'scrooloose/syntastic'				" Syntax checking on write
	Plugin 'tpope/vim-fugitive'					" Git wrapper
	Plugin 'tpope/vim-surround'					" Manipulate quotes and brackets
	Plugin 'bling/vim-airline'					" Pretty statusbar
	Plugin 'vim-airline/vim-airline-themes'		" vim airline themes
	Plugin 'terryma/vim-multiple-cursors'		" Multiple cursors work
	Plugin 'edkolev/promptline.vim'				" Prompt generator for bash
	Plugin 'altercation/vim-colors-solarized.git'	" Solarized theme
	"Plugin 'nathanaelkane/vim-indent-guides.git'	" Show tab/space guides

  " All of your Plugins must be added before the following line
call vundle#end()

if has("win32")
	set runtimepath+=~/.vim
endif

"}}}
" Settings {{{
" -----------------------------------------------------------------------------

" File detection
filetype on
filetype plugin indent on
syntax on

" General
set backspace=2						" enable <BS> for everything
"set colorcolumn=80					" visual indicator of column
set number							" Show line numbers
set completeopt=longest,menuone		" Autocompletion options
set complete=.,w,b,u,t,i,d			" autocomplete options (:help 'complete')
set hidden							" hide when switching buffers, don't unload
set laststatus=2					" always show status line
set lazyredraw						" don't update screen when executing macros
set mouse=a							" enable mouse in all modes
set noshowmode						" don't show mode, since I'm already using airline
set nowrap							" disable word wrap
set showbreak="+++ "				" String to show with wrap lines
set number							" show line numbers
set showcmd							" show command on last line of screen
set showmatch						" show bracket matches
set textwidth=0						" don't break lines after some maximum width
set ttyfast							" increase chars sent to screen for redrawing
"set ttyscroll=3					" limit lines to scroll to speed up display
set title							" use filename in window title
set wildmenu						" enhanced cmd line completion
set wildchar=<TAB>					" key for line completion
set noerrorbells					" no error sound
set splitright						" Split new buffer at right

" Folding
set foldignore=						" don't ignore anything when folding
set foldlevelstart=99				" no folds closed on open
set foldmethod=marker				" collapse code using markers
set foldnestmax=1					" limit max folds for indent and syntax methods

" Tabs
set autoindent						" copy indent from previous line
set noexpandtab						" no replace tabs with spaces
set shiftwidth=4					" spaces for autoindenting
set smarttab						" <BS> removes shiftwidth worth of spaces
set softtabstop=4					" spaces for editing, e.g. <Tab> or <BS>
set tabstop=4						" spaces for <Tab>

" Searches
set hlsearch						" highlight search results
set incsearch						" search whilst typing
set ignorecase						" case insensitive searching
set smartcase						" override ignorecase if upper case typed
set more							" Stop in list

" Status bar -> Replace with vim-airplane plugin
set laststatus=2					" show ever
set showmode						" show mode
set showcmd							" show cmd
set ruler							" show cursor line number
set shm=atI							" cut large messages

" Colours
set t_Co=256
if &term == "xterm"
	set background=dark
	colorscheme base16-default
else
	" Theme setting.
	" Two principal themes for dark and light background
	" Function ToggleColours
	" See comments in theme
	let g:hybrid_use_Xresources = 1
	set background=dark
	colorscheme hybrid_e7
endif

" gVim
if has('gui_running')
	if has("win32")
		set guifont=Lucida_Console:h8
		set lines=40							" Nº lines
		set columns=90							" Nº columns
	else
		set guifont=Inconsolata\ for\ Powerline\ 10
	endif
	set guioptions-=m							" remove menu
	set guioptions-=T							" remove toolbar
	set guioptions-=r							" remove right scrollbar
	set guioptions-=b							" remove bottom scrollbar
	set guioptions-=L							" remove left scrollbar
	set guicursor+=a:block-blinkon0				" use solid block cursor
	"Paste from PRIMARY and CLIPBOARD
	"inoremap <silent> <M-v> <Esc>"+p`]a
	"inoremap <silent> <S-Insert> <Esc>"*p`]a
endif

" vimdiff
if &diff
	set diffopt=filler,foldcolumn:0
endif

"}}}
" Mappings {{{
" -----------------------------------------------------------------------------

" Plugin Settings {{{
" -----------------------------------------------------------------------------
"  vim-airline
let g:airline_inactive_collapse = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
if has("gui_win32") || &term == "xterm"
	let g:airline_powerline_fonts = 0
	let g:airline_symbols = {}
	let g:airline_left_sep = ''
	let g:airline_left_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_sep = ''
	let g:airline_theme = 'air_e7'
else
	let g:airline_powerline_fonts = 1
	let g:airline_theme = 'air_e7'
endif

" Promptline
" \'b': [ promptline#slices#host(), promptline#slices#user() ],
let g:promptline_preset = {
	\'b': [ promptline#slices#cwd() ],
	\'c': [ promptline#slices#vcs_branch() ],
	\'z': [ promptline#slices#git_status() ],
	\'warn' : [ promptline#slices#last_exit_code() ]}
let g:promptline_theme = 'air_e7'

"}}}
" Autocommands {{{
" -----------------------------------------------------------------------------

" Omnicompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,xhtml setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Indent rules, Linux Kernel Coding Style
autocmd FileType c
	\ setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
	\ list lcs=tab:+·
autocmd FileType cpp,java,javascript,json,markdown,php,python
	\ setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
	\ list lcs=tab:+·
autocmd FileType markdown setlocal textwidth=80
autocmd FileType prg
	\ setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 cindent
	\ list lcs=tab:+·

" Txt
autocmd FileType text setlocal textwidth=79 wrap

" Folding rules
autocmd FileType c,cpp,java,prg setlocal foldmethod=syntax foldnestmax=5
autocmd FileType css,html,htmldjango,xhtml
	\ setlocal foldmethod=indent foldnestmax=20

" Set correct markdown extensions
autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn
	\ if &ft =~# '^\%(conf\|modula2\)$' |
	\	set ft=markdown |
	\ else |
	\	setf markdown |
	\ endif

" Set filetype for prg
autocmd BufNewFile,BufRead *.prg,*.dev,*.act,*.cas set ft=prg

"}}}
" Functions {{{
" -----------------------------------------------------------------------------

" Toggle Colours
function! ToggleColours()
	if &background  == 'dark'
		set background=light
		let g:solarized_bold=0
		colorscheme solarized
		AirlineTheme base16
	else
		set background=dark
		let g:hybrid_use_Xresources = 1
		colorscheme hybrid_e7
		AirlineTheme air_e7
	endif

	" Reconfigure term colors
	if !has('gui_running')
		if &background == 'light'
			if filereadable($HOME."/.config/termcolours/light.sh")
				execute "silent !/bin/sh ".$HOME."/.config/termcolours/light.sh"
			endif
		else
			if filereadable($HOME."/.config/termcolours/dark.sh")
				execute "silent !/bin/sh ".$HOME."/.config/termcolours/dark.sh"
			endif
		endif
	endif
endfunction

"}}}
" vim: set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4:
