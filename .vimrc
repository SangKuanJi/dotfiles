" General
filetype plugin on
filetype indent on
set autoread
let mapleader = " "
set clipboard=unnamedplus
set runtimepath^=~/notes

" UI
syntax on
set background=dark
set ruler
set backspace=eol,start,indent
set ignorecase
set smartcase
set incsearch
set lazyredraw
set nohlsearch
set magic
set showmatch
set foldcolumn=1
set number
set relativenumber
set completeopt=longest,menuone,preview
set previewheight=10
set laststatus=2
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
            \ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

"Files, backups and undo
set nobackup
set nowb
set noswapfile
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Text/Indent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set nowrap


" Quick fix
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" Vim Plug
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'w0rp/ale'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'dracula/vim', { 'as' : 'dracula' }
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'puremourning/vimspector'
call plug#end()
colorscheme gruvbox

" Vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" ALE
let g:ale_linters = { 'cs' : ['OmniSharp'] }
let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 1
let g:ale_echo_cursor = 0

" FZF
nmap <Leader><Tab> <Plug>(fzf-maps-n)
nmap <Leader>p :Files<CR>

" NerdTree
nnoremap <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['bin', 'obj']
let g:NERDTreeQuitOnOpen = 1

" vim-better-whitespace
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

" OmniSharp
let g:OmniSharp_timeout = 5
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_autoselect_existing_sln = 1
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_highlighting = 3
let g:OmniSharp_diagnostic_exclude_paths = [ 'Temp\\', 'obj\\', '\.nuget\\' ]



augroup omnisharp_commands
    autocmd!
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader><Space> :OmniSharpGetCodeActions<CR>
    autocmd FileType cs xnoremap <buffer> <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
    autocmd FileType cs nnoremap <buffer> <F2> :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>cf :OmniSharpCodeFormat<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>rt :OmniSharpRunTest<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>rT :OmniSharpRunTestsInFile<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>ss :OmniSharpStartServer<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>sp :OmniSharpStopServer<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
    autocmd BufWritePre *.cs :OmniSharpCodeFormat
augroup END
