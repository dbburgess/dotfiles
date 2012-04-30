" Load the Pathogen plugin, which makes managing plugins awesome.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Enable plugins and indentation.
filetype plugin on
filetype indent on

" General / functional settings.
set nocompatible " Remove vi compatability, we don't need that.
set encoding=utf-8 " Set a proper encoding.
set hidden " Ensure buffers aren't unloaded prematurely.
set ttyfast " Set that we have a fast connection for this terminal.
set nofoldenable " Disable folding, I don't really like it in vim.
set t_Co=256 " Enable 256 colors
colorscheme inkpot " Set a nice colorscheme.
syntax enable " Enable syntax highlighting.

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

" Map a hotkey to easily enable/disable the targeting reticule.
" This is useful, because performance with it on can be kind of slow at times.
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

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



" Enable Neocomplcache plugin (for awesome auto-complete).
let g:neocomplcache_enable_at_startup = 1

" Enable usage of ack from within vim.
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Strip trailing whitespace from all lines when saving.
autocmd BufWritePre * :%s/\s\+$//e

" Stuff to think about / try out:
" :help shortmess=???
