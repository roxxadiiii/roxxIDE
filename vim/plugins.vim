" Auto-install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Add plugins here
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'roxxide' ], [ 'lineinfo' ], [ 'percent' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v',
      \   'roxxide': 'roxxIDE'
      \ },
      \ }

Plug 'preservim/vim-indent-guides'

" PLUGINS FOR NERDTREE

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'


"MARKDOWN PLUGINS
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'ellisonleao/glow.nvim'

Plug 'gruvbox-community/gruvbox'
Plug 'jiangmiao/auto-pairs' "auto completes [] and () and makes life a bit easier
Plug 'tpope/vim-commentary' "Comment stuff
Plug 'tpope/vim-surround' "Allows me to change { to [ and what not
Plug 'wellle/targets.vim' "adds more targets like [ or , - lazy but useful
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-css-color' " Highlighting color codes


Plug 'mhinz/vim-startify'

" ── LSP ────────────────────────────────────────────────────────
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prettier/vim-prettier'
Plug 'neoclide/coc.nvim'

call plug#end()
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
