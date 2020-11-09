"map leader
let mapleader = ","
let g:mapleader = ","
call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight' 
Plug 'vim-scripts/restore_view.vim'
Plug 'easymotion/vim-easymotion'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'voldikss/vim-floaterm'
call plug#end()

set nocompatible
filetype plugin on
syntax on 

set noerrorbells
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smartindent
set autoindent
set copyindent
set backspace=indent,eol,start
set rnu
set nu
set nowrap
set hidden
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set cursorline
set mouse=a
set visualbell
set updatetime=200
set timeout timeoutlen=200 ttimeoutlen=100
set t_Co=256
set cursorline
set clipboard+=unnamedplus
set guioptions-=e
set ruler
set autochdir
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
"set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set formatoptions-=cro                  " Stop newline continution of comments

"use terminal bg color
if (has("autocmd") && !has("gui_running"))
	augroup colorset
		autocmd!
		let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
		autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
	augroup END
endif
hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
colorscheme onedark

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

"source config form plug-config
source $HOME/.config/nvim/plug-config/airline.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
luafile $HOME/.config/nvim/plug-config/colorizer.lua
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]
let g:rnvimr_ex_enable = 1


"escape changed
imap ff <esc>

"auto-indent paste
nnoremap p p=`]

"fast save
nmap <leader>w :w!<cr>
imap <leader>w <esc>:w!<cr>

"auto directory change
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"easy comment toggle
nmap // <leader>c<space>
vmap // <leader>c<space>
imap // <esc><leader>c<space>

"easymotion mappings
nmap <PageUp><PageUp> <Plug>(easymotion-overwin-w)
nmap <PageUp> <Plug>(easymotion-overwin-f)
imap <PageUp><PageUp> <esc><Plug>(easymotion-overwin-w)
imap <PageUp> <esc><Plug>(easymotion-overwin-f)

"compile -O2 flag
nnoremap <F8> :w!<cr>:!g++ -std=c++17 -Wshadow -Wall -o %:r % -O2 -Wno-unused-variable -DLOCAL<cr>
inoremap <F8> <esc>:w!<cr>:!g++ -std=c++17 -Wshadow -Wall -o %:r % -O2 -Wno-unused-variable -DLOCAL<cr>
"run code
nnoremap <F9> :!./%:r<CR>

"Some sane mappings for the love of god

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" qq to delete the current buffer
nnoremap qq :w\|bd<cr>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

"Ranger Toggle
nmap <Leader>r :RnvimrToggle<CR>
