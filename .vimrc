set number

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme dracula

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" YAML support for VIM
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_setColors = 0
let g:indentLine_char = '⦙'

" Better tab experience - from https://webdevetc.com/
map <leader>tn :tabnew<cr>
map <leader>t<leader> :tabnext
map <leader>tm :tabmove
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

" NERDTree toggle
map <silent> <C-n> :NERDTreeToggle<CR>

set t_Co=16

" show the current file path on the bottom
set laststatus=2
" set statusline+=%F
function! StatuslineGit()
	  let l:branchname = GitBranch()
	    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
    endfunction

set statusline=
set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

" fzf shortcut
map <silent> <C-f> :Files<CR>

" vim-go mapping
map <F12> :GoDef<CR>
autocmd Filetype go nmap <F9> :GoReferrers<CR>

set incsearch "find the next match as we type the search
set hlsearch  "hilight searches by default
