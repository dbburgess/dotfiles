" Remove vi compatability, we don't need that.
set nocompatible

" --- Begin vim-plug Configuration --------------------------- "

" Automagically install vim-plug if it isn't installed already.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" --- vim-plug Plugin Management ----------------------------- "
call plug#begin('~/.vim/plugged')

" -------------------------------
" Crucial core functional plugins.
" -------------------------------

" Command-T for sweet intelligent file finder.
" Command-T requires compliation with ruby. The version of ruby must match the
" version of ruby vim is using. This is an awkward / unreliable way for this.
" The path given here refers to our port install of ruby.
Plug 'wincent/Command-T', { 'do': 'cd ruby/command-t && /opt/local/bin/ruby2.0 extconf.rb && make' }

" YouCompleteMe for awesome auto completion.
" YouCompleteMe requires compilation with python.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" -------------------------------
" Fun UI plugins.
" -------------------------------
Plug 'vim-airline/vim-airline' " Sweet upgraded status bar.

" -------------------------------
" Language-specific plugins.
" -------------------------------
Plug 'groenewege/vim-less', { 'for': 'less' }

call plug#end()
" --- Finish vim-plug Configuration -------------------------- "

" General / functional settings.
set encoding=utf-8 " Set a proper encoding.
set hidden " Ensure buffers aren't unloaded prematurely.
set ttyfast " Set that we have a fast connection for this terminal.
set nofoldenable " Disable folding, I don't really like it in vim.
set t_Co=256 " Enable 256 colors
colorscheme Tomorrow-Night-Bright " Set a nice colorscheme.

" Remap the <leader> to ,.
let mapleader = ","

" Some basic mappings...
" Remap q: to q;, as it is a helpful shortcut.
map q; q:
" Remap ; to :, so we can save a shift key for every command.
noremap ; :

" Make it so the screen scrolls when nearing the edge.
set scrolloff=10
set sidescrolloff=10

" Enable the awesome wildmenu, providing the auto-completion for files, etc.
set wildmenu
set wildmode=list:longest,full

" Backup settings.
set backup " Enable backups.
set backupdir=~/.vim/backup " Set a custom backup directory, so we don't clutter up working directories.

" Set a custom swap file directory, so we don't clutter up working directories.
set directory=~/.vim/swapfiles// " The // at the end ensures the filename is unique, as it uses the full file path instead of just the name.

" Tab / indentation settings.
set tabstop=4 " Tabs should be displayed as 4 columns.
set shiftwidth=4 " Set the number of columns for reindent operations.
set softtabstop=4 " Set the number of columns to use when tab is pressed.
set expandtab " Convert tabs into spaces, when pressing tab.
set smarttab " Make tabs smart.
set autoindent " Automatically indent a new line to the current level.
set backspace=indent,eol,start " Make backspace behave sanely.

" Display / visual cue settings.
set title " Enable setting the terminal title, when possible.
set number " Enable showing line numbers.
set showmode " Show the current mode the user is in.
set showcmd " Show the current command.
set ruler " Display the ruler, to know where we are in the file.
set laststatus=2 " Force the status bar on all the time.
set list " Enable whitespace to be seen at startup.
set listchars=tab:▸\ ,trail:·,eol:¬ " Set whitespace characters to something I like.

" Enable the targeting reticule when first opening vim.
autocmd VimEnter * setlocal cursorline
autocmd VimEnter * setlocal cursorcolumn

" Move the targeting reticule when your window focus changes.
autocmd WinEnter * setlocal cursorline
autocmd WinEnter * setlocal cursorcolumn
autocmd WinLeave * setlocal nocursorline
autocmd WinLeave * setlocal nocursorcolumn

" Force md files to be markdown, instead of Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Settings for moving / searching.
set ignorecase " Set searching to ignore case by default.
set smartcase " Set searching to care about case, when you use uppercase.
set gdefault " Default to a global replace, since we never really replace just one thing.
set incsearch " Enable incremental searching (starts searching as you type).
set hlsearch " Enable highlighting when searching.

" Map the tab key to finding matching pairs.
nmap <tab> %
vmap <tab> %

" Hide search highlighting with a hotkey.
nnoremap <leader><space> :noh<cr>

" Disable vim regexes, and default to Perl/Python compatible regexes.
nnoremap / /\v
vnoremap / /\v

" ------------------------------ "
" Handy Custom Shortcuts:
" ------------------------------ "
" Use <leader>s to show / hide whitespace.
nmap <silent> <leader>s :set nolist!<CR>

" Map a hotkey to easily enable/disable the targeting reticule.
" This is useful, because performance with it on can be kind of slow at times.
:nnoremap <leader>c :set cursorline! cursorcolumn!<CR>

" Easily show / hide the number line.
:nnoremap <leader>l :set number!<CR>

" Easily show / hide all of the extra features (makes it easy to copy/paste).
:nnoremap <leader>d :set nolist! cursorline! number!<CR>

" Easily turn on / off paste mode.
:nnoremap <leader>p :set paste!<CR>

" Use jj to escape insert mode.
inoremap jj <ESC>

" Map <leader>a to run ack.
nnoremap <leader>a :Ack

" Useful mappings for splits.
" <leader>w opens a new vertical split.
nnoremap <leader>w <C-w>v<C-w>l
" Ctrl-hjkl navigates windows.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Format json files easily.
" You must run this to enable it: sudo cpan JSON::XS
map <leader>jf <Esc>:%!json_xs -f json -t json-pretty<CR>


" Enable Neocomplcache plugin (for awesome auto-complete).
let g:neocomplcache_enable_at_startup = 1

" Enable usage of ack from within vim.
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Strip trailing whitespace from all lines when saving.
autocmd BufWritePre * :%s/\s\+$//e

" vim-airline configuration.
let g:airline_powerline_fonts = 1

" Stuff to think about / try out:
" :help shortmess=???
