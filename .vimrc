" -----------------------------------------------------------------------------
" This config expects you to have Plug installed.
" refs: https://github.com/nickjj/dotfiles/blob/master/.vimrc
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
" To install: curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
"
" Reload .vimrc and :PlugInstall to install plugins.

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'

" Gruvbox Community theme.
Plug 'gruvbox-community/gruvbox'

Plug 'bronson/vim-trailing-whitespace'

" Show git file changes in the gutter.
Plug 'mhinz/vim-signify', { 'branch': 'legacy' }

" Shows the context of the currently visible buffer contents
Plug 'wellle/context.vim'

" https://github.com/mg979/vim-visual-multi
Plug 'mg979/vim-visual-multi'
call plug#end()

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

" Enable syntax highlighting.
syntax on

" Specific colorscheme settings (must come before setting your colorscheme).
if !exists('g:gruvbox_contrast_light')
  let g:gruvbox_contrast_light='hard'
endif

" Set the color scheme.
colorscheme gruvbox
set background=dark

" Specific colorscheme settings (must come after setting your colorscheme).
if (g:colors_name == 'gruvbox')
  if (&background == 'dark')
    hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a
  else
    hi Visual cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi CursorLine cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
  endif
endif

" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------

let mapleader=" "
let maplocalleader=" "


" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set cursorline
"set updatetime=100
set showmode
"set showcmd
set backspace=indent,eol,start
set scrolloff=5
set mouse=nicr              " allow scroll in iterm2 with mouse

set ignorecase
set smartcase
set incsearch
set hlsearch

set ruler                  " always show info along bottom
set number relativenumber

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set smartindent

set wildmenu

" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

" learn the hjkl
noremap <UP> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" esc in insert mode with jj
inoremap jj <esc>

" esc in visual mode with jk
"vnoremap jk <esc>

" esc in command mode with jj
cnoremap jj <C-C>

nnoremap <C-j> i<CR><ESC>

" toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>

" Print colon when hitting semicolor
map ; :
" -----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Basic commands
" ----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------

" .............................................................................
" preservim/nerdtree - NERDTree
" .............................................................................

"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" .............................................................................
" vim-airline/vim-airline
" .............................................................................

" :echo g:airline_section_z
au User AirlineAfterInit :let g:airline_symbols.linenr = ' '
au User AirlineAfterInit :let g:airline_symbols.maxlinenr = ''
au User AirlineAfterInit :let g:airline_symbols.colnr = ' :'

"au User AirlineAfterInit :let g:airline_symbols.linenr = ' ln:'
"au User AirlineAfterInit :let g:airline_symbols.maxlinenr = '☰ '
"au User AirlineAfterInit :let g:airline_symbols.colnr = ' cn:'

" ----------------------------------------------------------------------------
" IdeaVin
"   https://github.com/JetBrains/ideavim
"   https://github.com/JetBrains/ideavim/wiki/%22set%22-commands
"   https://towardsdatascience.com/the-essential-ideavim-remaps-291d4cd3971b
" ----------------------------------------------------------------------------

if has('ide')
  " mappings and options that exist only in IdeaVim
  "map <leader>f <Action>(GotoFile)
  "map <leader>g <Action>(FindInPath)
  "map <leader>b <Action>(Switcher)

  if &ide =~? 'intellij idea'
    if &ide =~? 'community'
      " some mappings and options for IntelliJ IDEA Community Edition
    elseif &ide =~? 'ultimate'
      " some mappings and options for IntelliJ IDEA Ultimate Edition
    endif
  elseif &ide =~? 'goland'
    " GoLand specific mappings and options
  endif
else
  " some mappings for Vim/Neovim
endif

" ----------------------------------------------------------------------------
" Temp
" ----------------------------------------------------------------------------
"func! WordProcessorMode()
" setlocal textwidth=80
" setlocal spell spelllang=en_us
" setlocal noexpandtab
"endfu
"com! WP call WordProcessorMode()

