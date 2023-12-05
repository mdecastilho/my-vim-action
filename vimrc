" credits: 
" http://nvie.com/posts/how-i-boosted-my-vim/
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/s
" http://wekeroad.com/2010/07/29/vim-is-your-daddy/
" http://derekwyatt.org/vim/vim-tutorial-videos/vim-novice-tutorial-videos/

" use Vim settings, rather then Vi settings (much better!).
" this must be first, because it changes other options as a side effect.
set nocompatible

" quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e  $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" use pathogen (https://github.com/tpope/vim-pathogen) 
" to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
execute pathogen#infect()

" (...) never ever let Vim write a backup file! They did that in the 70’s...
set nobackup
set noswapfile

" hide buffers when not displayed
set hidden

" incsearch, showmatch and hlsearch work together to highlight search results (as you type). 
" It’s really quite handy, as long as you have the next line as well.
set incsearch
set showmatch
set hlsearch

" ignorecase and smartcase together make Vim deal with case-sensitive search intelligently. 
" if you search for an all-lowercase string your search will be case-insensitive, 
" but if one or more characters is uppercase the search will be case-sensitive. 
" most of the time this does what you want.
set ignorecase
set smartcase

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" store lots of :cmdline history
set history=1000

if has('gui_running')
  set guifont=MesloLGS\ NF\:h14
else
  " 256 colors in terminal
  set t_Co=256
endif
"
" for vim 8
if (has('termguicolors'))
  set termguicolors
endif

" https://github.com/tonsky/FiraCode/issues/462
set renderoptions=type:directx
set encoding=utf-8

" colors and fonts
colorscheme lucius
LuciusDarkHighContrast

" enable italics, make sure this is immediately after colorscheme
" https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
highlight comment cterm=italic gui=italic

" http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
" remove menu bar/toolbar/right-hand scroll bar
set guioptions-=m
set guioptions-=T 
set guioptions-=r 

" line numbers
set number

" indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" switch to paste mode, disabling all kinds of smartness 
" and just pasting a whole buffer of text
set pastetoggle=<F2>

" some stuff to get the mouse going in term
set mouse=a

" make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions+=$

" make command line two lines high
set ch=2

" set the status line the way i like it
set stl=%f\ %r%{fugitive#statusline()}\ %l/%L[%p%%]\,%v\ #%n

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" make the command-line completion better
set wildmenu

" turn on syntax highlighting
syntax on

" load ftplugins and indent files
filetype plugin on
filetype indent on

" if you are still getting used to Vim and want to force yourself to stop using the arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" if you like long lines with line wrapping enabled, 
" this solves the problem that pressing down jumpes your cursor “over” the current line to the next line. 
" it changes behaviour so that it jumps to the next row in the editor (much more natural)
nnoremap j gj
nnoremap k gk

" http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" https://superuser.com/questions/1056929/open-file-in-vertical-split-in-vim-netrw
let g:netrw_altv=1

" https://github.com/tpope/vim-fugitive/issues/508
"set diffopt+=vertical

" If installed using Homebrew
" set rtp+=/usr/local/opt/fzf

" fzf - maps fuzzy file search to Ctrl-p
nnoremap <C-p> :Files<Cr>
