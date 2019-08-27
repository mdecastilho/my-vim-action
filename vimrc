" credits: 
" http://nvie.com/posts/how-i-boosted-my-vim/
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/s
" http://wekeroad.com/2010/07/29/vim-is-your-daddy/
" http://derekwyatt.org/vim/vim-tutorial-videos/vim-novice-tutorial-videos/

" use Vim settings, rather then Vi settings (much better!).
" this must be first, because it changes other options as a side effect.
set nocompatible

" quickly edit/reload the vimrc file
nmap <silent> <leader>er :e  $MYVIMRC<cr>
nmap <silent> <leader>sr :so $MYVIMRC<cr>

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
  if has('gui_win32')
    set guifont=Fira\ Code\ Retina:h11
  endif
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
colorscheme jellybeans

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
set diffopt+=vertical

" Set the type lookup function to use the preview window instead of echoing it
"let g:OmniSharp_typeLookupInPreview = 1

" https://blog.bigfont.ca/vim-with-csharp-dotnet-and-omnisharp-on-windows/
"let g:OmniSharp_server_type = 'roslyn' 
"let g:OmniSharp_prefer_global_sln = 1

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

" Fetch semantic type/interface/identifier names on BufEnter and highlight them
let g:OmniSharp_highlight_types = 1

augroup omnisharp_commands
    autocmd!
    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " Update the highlighting whenever leaving insert mode
    autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

    " Alternatively, use a mapping to refresh highlighting for the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>rr :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" https://github.com/OmniSharp/omnisharp-vim/wiki/Test-Runner
nnoremap <leader>rt :OmniSharpRunTests<cr>
nnoremap <leader>rf :OmniSharpRunTestFixture<cr>
nnoremap <leader>ra :OmniSharpRunAllTests<cr>
nnoremap <leader>rl :OmniSharpRunLastTests<cr>
