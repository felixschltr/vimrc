"# Packages
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type':'opt'})          "minpac package manager
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('arcticicestudio/nord-vim')             "nord colorscheme
call minpac#add('alpertuna/vim-header')             "add file-speiififc headers
call minpac#add('jiangmiao/auto-pairs')             "auto pair parantheses and quotes
call minpac#add('davidhalter/jedi-vim')             "jedi for python completion	
call minpac#add('itchyny/lightline.vim')            "nightline statusbar
call minpac#add ('preservim/nerdtree')              "nerdtree plugin
call minpac#add('sirver/UltiSnips')             "creating custom code snippets
call minpac#add('Vimjas/vim-python-pep8-indent', {'type': 'opt'})           "python indentation
call minpac#add('vim-latex/vim-latex')          "latex support for vim
"call minpac#add('cmugpi/vim-c0')                "synatx highlighting for c0 lang

"custom minpack commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

"# Colors and Theme
set t_Co=256            "enable 256 colors
set termguicolors       "important for nord theme to work

syntax on               "enable syntax highlighting
set number              "enable line numbering by default
let g:lightline = {'colorscheme': 'nord'}           "let lightline plugin use nord colorscheme              
let g:nord_italic = 1           "display italic
let g:nord_italic_comments = 1              "display comments italic
let g:nord_bold_vertical_split_line = 1             "highlight vertical split line
colorscheme nord        "set colorscheme
set laststatus=2        "for lightline plugin to see statusline
set noshowmode          "for lightline plugin to hide '--INSERT--'

filetype on             "enable filetype and indentation
filetype plugin indent on

"###### Instructions to override setting for highlighting of colorcolumn of
"colorscheme ############
"1) locate colorscheme folder (~/.vim/pack/minpac/start/nord-vim/colors/nord.vim)
"2) search for pattern 'ColorColumn'
"3) change 's:nord1_gui' to "HTML-color-code-of-choice"

"recognize markdown files
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"recognize c0 files
autocmd BufNewFile,BufFilePre,BufRead *.c0
    \ setlocal tabstop=4 shiftwidth=4
    \ | setlocal colorcolumn=80
    \ | setlocal spell spelllang=en

"recognize c++ files
autocmd BufNewFile,BufFilePre,BufRead *.cpp 
    \ setlocal tabstop=4 shiftwidth=4
    \ | setlocal colorcolumn=80
    \ | setlocal spell spelllang=en

set noshowmode          "hide --INSERT--

set nocp                "set not compatible mode to enable vim features

set showcmd             "show typed commands  when in normalmode

set wildmenu            "show possible completions in command mode using Tab

set cursorline          "highlight current line

set showmatch           "highlight matches

set tabstop=4               "number of visual spaces per tab

set softtabstop=4           "number of spaces in tab

set expandtab           "tabs are spaces

"# Python-related
autocmd BufNewFile,BufRead *.py packadd! vim-python-pep8-indent

"#Nerdtree
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

"# Header settings
let g:header_auto_add_header = 0		"header not added automatically
let g:header_field_author = 'Felix Schlueter'
let g:header_field_author_email = 'f.schlueter@tuta.io'
"maps header command to F4 key
map <F4> :AddHeader<CR> 

"# Jedi settings
let g:jedi#popup_on_dot = 0            "prevent jedi popup for . 
let g:jedi#completions_command = "<C-Space>"

"#UltiSnip settings
let g:UltiSnipsEditSplit="vertical"     "to resolve E37 issue

"#Latex suite settings
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf='evince'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'
let g:Tex_CompileRule_pdf = 'arara -v $*'
map <Leader>lp :!pdflatex %<CR>
let g:Tex_SmartKeyDot=0             "prevent ... to automatically expand to \dots
let g:Tex_Leader=','                "sets leader key for vim-latex mappings
