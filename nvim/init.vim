if !filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" Tools
Plug 'AndrewRadev/linediff.vim'                    " Diff two visual selections
Plug 'w0rp/ale'                                    " Linting
if !has('mac')
  Plug 'cazador481/fakeclip.neovim'                " Use X and tmux clipboard
endif
Plug 'cloudhead/neovim-fuzzy'                      " Fuzzy File Finder
Plug 'Konfekt/FastFold'                            " Speed up folds
Plug 'noahfrederick/vim-skeleton'                  " Provides skeleton file
Plug 'ntpeters/vim-better-whitespace'              " Easily strip whitespace
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tmhedberg/SimpylFold', {'for': 'python'}     " Python folding
Plug 'tpope/vim-abolish'                           " Smarter find-replacement
Plug 'tpope/vim-afterimage'                        " Edit images, pdfs, and word
Plug 'tpope/vim-eunuch'                            " Handy UNIX commands
Plug 'tpope/vim-fugitive'                          " Git plugin
Plug 'tpope/vim-repeat'                            " Use . to repeat plugin stuff
Plug 'tpope/vim-sleuth'                            " Figure out tabs
Plug 'tpope/vim-unimpaired'                        " Add lots of handy mappings
Plug 'vimoutliner/vimoutliner'                     " Outlines
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Completion
Plug 'Shougo/context_filetype.vim'                 " Add context filetype
Plug 'Shougo/deoplete.nvim'                        " Completion
Plug 'Shougo/echodoc.vim'                          " Print documentation
Plug 'Shougo/neoinclude.vim'                       " Completion framework
Plug 'jiangmiao/auto-pairs'                        " Autoclose after completion
Plug 'fszymanski/deoplete-emoji'
Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}
Plug 'wellle/tmux-complete.vim'                    " Completion from tmux panes
Plug 'zchee/deoplete-jedi', {'for': 'python'}      " Python completion
Plug 'zchee/deoplete-clang'                      " C/C++ completion

" Editing
Plug 'AndrewRadev/splitjoin.vim'                   " Splitting and joining
Plug 'Chiel92/vim-autoformat'                      " Automagically format
Plug 'Shougo/neosnippet.vim'                       " Snippets Engine
Plug 'Shougo/neosnippet-snippets'                  " Base snippets
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.py' }
Plug 'junegunn/vim-easy-align'                     " Align things more easily
Plug 'lervag/vimtex', {'for': 'tex'}               " Latex Plugin
Plug 'machakann/vim-sandwich'                      " Change surrounding chars
Plug 'michaeljsmith/vim-indent-object'             " Indents as text objects
Plug 'raymond-w-ko/vim-lua-indent', {'for': 'lua'} " Better lua indents
Plug 'rhysd/clever-f.vim'                          " Better f and t
Plug 'rhysd/vim-grammarous'                        " Grammar checking
Plug 'sheerun/vim-polyglot'                        " Support for many languages
Plug 'tpope/vim-commentary'                        " Comment things with gc
Plug 'tpope/vim-ragtag'                            " More tag mappings
Plug 'wellle/targets.vim'                          " More text objects

" UI
Plug 'ap/vim-css-color'                            " Colors your hex colors
Plug 'vim-airline/vim-airline'                     " Tabline/status bar for vim
Plug 'vim-airline/vim-airline-themes'              " Themes for Airline
Plug 'majutsushi/tagbar'                           " Display tags in a window
Plug 'morhetz/gruvbox'                             " Colors!


call plug#end()


"""""""""""""""
"   General   "
"     Vim     "
"""""""""""""""

"" Load plugins and indentation for specific filetypes
filetype plugin indent on

"" Syntax highlighting
syntax on

"" title in the titlebar.  A bit weird
set titlestring=VIM:\ %-5.10t\ %a%r%m titlelen=15
set title

"" Put temps somewhere else
silent !mkdir -p ~/.local/share/nvim/swaps/
silent !mkdir -p ~/.local/share/nvim/backups/
silent !mkdir -p ~/.local/share/nvim/undo/

set directory=~/.local/share/nvim/swaps//
set backupdir=~/.local/share/nvim/backups//
set undodir=~/.local/share/nvim/undo//
set undofile

" Fuzzy bindings
nnoremap <C-p> :FuzzyOpen<CR>
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" Don't allow netrwhist to be created
let g:netrw_dirhistmax = 0
" Change vim skeleton file
let g:skeleton_template_dir = "~/.config/nvim/templates"

" Make the mouse useful
set mouse=a

" Set <leader>
let mapleader = "-"

" Allow switching buffers without saving
set hidden

" Word wrapping is fine, just don't insert newlines, please.
set wrap linebreak list
set textwidth=0
set wrapmargin=0

" Split more naturally
set splitbelow
set splitright

" Don't ring the terminal bell
set visualbell t_fb=

" Incsub stuff
set inccommand=nosplit
" Clear search term
command Clear let @/ = ""
" Ignore case when lowercase is used in the search
set ignorecase smartcase
" Highlight search results
set hlsearch
" Move to matched string while typing the search pattern
set incsearch
" Wrap search around end-of-file
set wrapscan

" Completion for commands
set wildmenu

"" Remember cursor position on buffer leave
augroup cursorRemember
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
augroup end


"""""""""""""""
"    Colors   "
"    & GUI    "
"""""""""""""""

"" Use truecolor
set termguicolors
set background=dark

"" gruvbox colors
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
let g:hybrid_custom_term_colors = 1

colorscheme gruvbox
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" ALE with airline
let g:airline#extensions#ale#enabled = 1
" Use this if you have a colorscheme that breaks terminal transparency
hi Normal ctermbg=none

"" Change cursor shape
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


"""""""""""""""
" Completions "
"   & Pairs   "
"""""""""""""""

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
let g:deoplete#enable_at_startup = 1

" Show matching parenthesis
set showmatch
" Easy pair manipulation
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" deoplete + neosnippet + autopairs changes
let g:AutoPairsMapCR=0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

" conceal neosnippet markers
set conceallevel=2
set concealcursor=niv

" Deoplete-clang

let g:deoplete#sources#clang#libclang_path = "/usr/lib64/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib64/clang/6.0.1/include/"

"""""""""""""""
"  Numbers,   "
"    Tabs,    "
"  & Aligns   "
"""""""""""""""

" ---------- Numbers ----------
" Show line numbers
set number
augroup line_numbers
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup END

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

" NumberToggle()
nnoremap <C-n> :call NumberToggle()<CR>

" ------------ Tabs -----------
" Autoindentation.
set autoindent

"" tabs
set tabstop=4 expandtab shiftwidth=4 smarttab

" Allow backspacing over line breaks, start of insert action, and autoindentation
set backspace=eol,start,indent

" ---------- Aligns -----------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Edited from the dotfiles of @m-wynn
