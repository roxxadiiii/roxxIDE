set noshowmode
let g:gruvbox_italic='1'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
let g:gruvbox_termcolors='256'
let g:AutoPairsFlyMode=0
colorscheme gruvbox "colorscheme
let g:indent_guides_enable_on_vim_startup = 1

" Make background completely transparent
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
highlight Folded guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE
highlight VertSplit guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE


"Global options
filetype plugin indent on
syntax on "activates syntax highlighting among other things
set background=dark "set hg group to dark
set backspace=indent,eol,start "Fixes the backspace
set conceallevel=1 "Allows me to conceal latex syntax if not on line
set encoding=utf-8 "required by YCM
set expandtab
set foldlevel=99
set foldmethod=indent "fold your code.
set hidden "work with multiple unsaved buffers.
set incsearch "highlights as you search
set ignorecase
set smartcase
set rnu nu "sets line numbers
set splitbelow splitright
set termguicolors "True colors term support
set viminfo+=n~/.vim/viminfo
set omnifunc=syntaxcomplete#Complete
set undodir="~/.vim/undo/"
set undofile
set laststatus=2
set showcmd
set number relativenumber
" ── LSP Keybindings ────────────────────────────────────────────
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes

  nmap <buffer> gd         <plug>(lsp-definition)
  nmap <buffer> gr         <plug>(lsp-references)
  nmap <buffer> gi         <plug>(lsp-implementation)
  nmap <buffer> K          <plug>(lsp-hover)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> <leader>ca <plug>(lsp-code-action)
  nmap <buffer> [d         <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]d         <plug>(lsp-next-diagnostic)
  nmap <buffer> <leader>e  <plug>(lsp-document-diagnostics)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ── Diagnostics UI ─────────────────────────────────────────────
let g:lsp_diagnostics_echo_cursor = 1       " show error under cursor in cmdline
let g:lsp_diagnostics_virtual_text_enabled = 0  " disable inline virtual text (less noise)
let g:lsp_signs_enabled = 1                 " show signs in gutter

" ── Autocompletion (asyncomplete) ──────────────────────────────
" Tab to confirm, Shift-Tab to go back
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"

let g:asyncomplete_auto_popup = 1   " popup appears automatically
let g:asyncomplete_popup_delay = 80 " ms delay before popup
