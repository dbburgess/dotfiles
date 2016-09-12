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

" Better % matching.
Plug 'tmhedberg/matchit'

" Automagically set paste mode when pasting.
Plug 'ConradIrwin/vim-bracketed-paste'

" Git integration.
Plug 'tpope/vim-fugitive'

" Syntax checking.
Plug 'scrooloose/syntastic'

" Force Syntastic to use local eslint,
" so custom per-project configs work nicely
Plug 'mtscout6/syntastic-local-eslint.vim'

" Quoting and other stuff, made easy!
Plug 'tpope/vim-surround'

" Auto-close characters that are usually paired, such as parenthesis.
" Prevent auto closing quotes in vim files.
Plug 'spf13/vim-autoclose'
let g:autoclose_vim_commentmode = 1

" -------------------------------
" Fun UI plugins.
" -------------------------------
" Sweet upgraded status bar.
Plug 'vim-airline/vim-airline'

" Nifty startup screen.
Plug 'mhinz/vim-startify'

" File exploration!
" The second plugin here makes it behave sanely.
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Undo trees!
Plug 'mbbill/undotree'

" Git changes in the vim gutter, next to line numbers.
Plug 'airblade/vim-gitgutter'

" Nice line indentation indicators.
" Modifying the default indicator color to be much darker.
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 237

" A handy color table for terminal.
" Open using :XtermColorTable
Plug 'guns/xterm-color-table.vim'

" -------------------------------
" Language-specific plugins.
" -------------------------------

" --- JavaScript.
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Semantic auto completion for JavaScript (hooks into YCM).
Plug 'marijnh/tern_for_vim', { 'for': 'javascript' }
" Syntax for JSX.
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
" Permit JSX syntax in .js files.
let g:jsx_ext_required = 0

" --- Swift.
Plug 'keith/swift.vim', { 'for': 'swift' }

" --- LESS.
Plug 'groenewege/vim-less', { 'for': 'less' }

" --- Markdown.
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" --- Dockerfile.
Plug 'ekalinin/Dockerfile.vim'

" --- Lua.
Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua' }
Plug 'xolox/vim-misc', { 'for': 'lua' }
Plug 'xolox/vim-lua-inspect', { 'for': 'lua' }

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

" Preferred tab settings for JavaScript
augroup configgroup
    autocmd FileType javascript setlocal tabstop=2
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType javascript setlocal softtabstop=2
augroup END

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

" Helpful function to strip trailing whitespaces,
" but also while maintaining cursor position.
" Source: http://unix.stackexchange.com/a/75438
function! <SID>StripTrailingWhitespaces()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif

    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

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

" Useful mappings for splits.
" <leader>w opens a new vertical split.
nnoremap <leader>w <C-w>v<C-w>l
" Ctrl-hjkl navigates windows.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Handy shortcuts for our plugins.
map <leader>e :NERDTreeTabsToggle<CR>
map <leader>u :UndotreeToggle<CR>

" Strip trailing whitespace from all lines when saving.
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Don't strip trailing whitespace in diff file types.
" This was particularly problematic for me when editing
" a git patch, as if the patch had trailing whitespace,
" the patch would fail when I tried to apply it.
" Source: http://stackoverflow.com/a/6496995/5191100
autocmd FileType diff let b:noStripWhitespace=1

" vim-airline configuration.
let g:airline_powerline_fonts = 1

" Configure CommandT's ignore list.
let g:CommandTWildIgnore = &wildignore
let g:CommandTWildIgnore .= ',**/.git/*'
let g:CommandTWildIgnore .= ',**/node_modules/*'

" Syntastic Configuration for pretty errors!
" Source: http://usevim.com/2016/03/07/linting/
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
