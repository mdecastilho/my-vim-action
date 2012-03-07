" credits: http://nvie.com/posts/how-i-boosted-my-vim/
" https://github.com/robconery/vim-settings

" quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" use Vim settings, rather then Vi settings (much better!).
" this must be first, because it changes other options as a side effect.
set nocompatible

" (...) never ever let Vim write a backup file! They did that in the 70’s...
set nobackup
set noswapfile

" hide buffers when not displayed
set hidden

" find the next match as we type the search
" hilight searches by default
set incsearch   
set hlsearch    

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" store lots of :cmdline history
set history=1000

" colors and fonts
colorscheme vividchalk 

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" line numbers
set number

" indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" switch to paste mode, disabling all kinds of smartness 
" and just pasting a whole buffer of text
set pastetoggle=<F2>

" some stuff to get the mouse going in term
set mouse=a

" turn on syntax highlighting
syntax on

"load ftplugins and indent files
filetype plugin on
filetype indent on

" use pathogen (https://github.com/tpope/vim-pathogen) 
" to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

