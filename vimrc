" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set smartindent
set autoindent
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set title                         " Set the terminal's title
set visualbell                    " No beeping.
set splitbelow                    " Split window below the current window.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set tabstop=3                    " Global tab width.
set shiftwidth=3                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set laststatus=2                  " Show the status line all the time

set shell=/bin/sh                " Use bash as the default shell - to solve RVM integreation problems

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

colorscheme monokai

" Refector RSepc before each block
vmap <Leader>bed "td?describe<CR>o<CR>before(:each) do<CR><ESC>"tp

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Rails shortcuts
map <leader>cc :! rake cucumber<cr>

" GIT shortcuts
map <leader>gi :! git init
map <leader>gar :! git add remote origin 
map <leader>ga :! git add .<cr>
map <leader>gc :! git commit -am 
map <leader>gph :! git push<cr>
map <leader>gpl :! git pull<cr>

" Jamis Buck's file opening plugin
map <Leader>t :FuzzyFinderTextMate<Enter>

"Clear the search highlighting by pressing the Escape key
nnoremap <esc> :noh<return><esc>    


"Shortcuts
"Edit .vimrc file
nmap ,ev :tabedit $MYVIMRC<cr>

"Map : for save time
nmap <space> :

"Nerdtree toggle
nmap ,nt :NERDTreeToggle<cr>

" Run shell commands
nmap ,sh :!<space>

" Search and replace all
nmap ,sr :%s/

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
"autocmd FileType ruby setlocal foldmethod=syntax
"autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec


" Tabular plugin Gist
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


" Source the vimrc file after saving it
if has("autocmd")
   autocmd bufwritepost .vimrc source $MYVIMRC
endif
