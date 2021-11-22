set scrolloff=8
syntax on
set nu
set mouse=a
set backspace=indent,eol,start

" File Presets
" +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
autocmd FileType tex setlocal shiftwidth=2 tabstop=2 spell
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4
autocmd FileType hs  setlocal set tabstop=8 softtabstop=0 expandtab shiftwidth=4
autocmd FileType c   setlocal shiftwidth=4 tabstop=4


" Linters
let b:ale_linters = {'haskell': ['ghc']}

" ALIASES
" +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
cnoreabbrev RsetVim source ~/.vimrc


" Plugins should be in the .vim/plugged folder in the home directory
call plug#begin('$HOME/.vim/plugged')

" Plugins go below here! 
Plug 'preservim/nerdcommenter'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nnoremap <leader>` :NERDTreeFocus<CR>
nnoremap <C-F1> :NERDTree<CR>
nnoremap <C-=> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" CoC -- Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Haskell
"languageclient is depreceated.
"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': './install.sh'
    "\ }


" VimTeX
Plug 'lervag/vimtex'

Plug 'rsaraf/vim-advanced-lint'

" Vim ALE
" Linter
Plug 'dense-analysis/ale'


Plug 'jceb/vim-orgmode'


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()







" this is a little script to moving through wrapped lines. This is done
" because I am using vim for LaTeX writing
" \ w is the toggle key
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction


" Default wrap on. Taken from above function
setlocal wrap linebreak nolist
set virtualedit=
setlocal display+=lastline
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>    

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" This allows for numerous custom configs in a per project basis
" Looks for a .vim.custom vimrc esque file
if filereadable(".vim.custom")
    so .vim.custom
endif

" This allows for the changing of views by pressing alt hjkl
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


