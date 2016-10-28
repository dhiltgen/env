execute pathogen#infect()
"colorscheme murphy
set background=dark

" Style information
highlight TrailingWhitespace ctermbg=red guibg=red
match TrailingWhitespace /\s\+$/

au BufRead *.txt setlocal spell

"set nohlsearch
"set ai
"set bg=dark
"set showmatch
"highlight SpecialKey ctermfg=DarkGray
"set listchars=tab:>-,trail:~
"set list
autocmd BufEnter,BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"set tabstop=4
"set shiftwidth=4
"set expandtab
"set autoindent
"set smartindent
"syntax on
"set listchars=tab:>-
"set listchars+=trail:.
"set ignorecase
"set smartcase

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4



"au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=8
"
"" What to use for an indent.
"" This will affect Ctrl-T and 'autoindent'.
"" Python: 4 spaces
"" C: tabs (pre-existing files) or 4 spaces (new files)
"au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
"au BufRead,BufNewFile *.py,*.pyw set expandtab
"fu Select_c_style()
"    if search('^\t', 'n', 150)
"        set shiftwidth=8
"        set noexpandtab
"    el 
"        set shiftwidth=4
"        set expandtab
"    en
"endf
"au BufRead,BufNewFile *.c,*.h call Select_c_style()
"au BufRead,BufNewFile Makefile* set noexpandtab
"
"" Use the below highlight group when displaying bad whitespace is desired.
"highlight BadWhitespace ctermbg=red guibg=red
"
"" Display tabs at the beginning of a line in Python mode as bad.
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
"" Make trailing whitespace be flagged as bad.
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"
"" Wrap text after a certain number of characters
"" Python: 79 
"" C: 79
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79
"
"" Turn off settings in 'formatoptions' relating to comment formatting.
"" - c : do not automatically insert the comment leader when wrapping based on
""    'textwidth'
"" - o : do not insert the comment leader when using 'o' or 'O' from command mode
"" - r : do not insert the comment leader when hitting <Enter> in insert mode
"" Python: not needed
"" C: prevents insertion of '*' at the beginning of every line in a comment
"au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r
"
"" Use UNIX (\n) line endings.
"" Only used for new files so as to not force existing files to change their
"" line endings.
"" Python: yes
"" C: yes
"au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
"
"
"" ----------------------------------------------------------------------------
"" The following section contains suggested settings.  While in no way required
"" to meet coding standards, they are helpful.
"
"" Set the default file encoding to UTF-8: ``set encoding=utf-8``
"
"" Puts a marker at the beginning of the file to differentiate between UTF and
"" UCS encoding (WARNING: can trick shells into thinking a text file is actually
"" a binary file when executing the text file): ``set bomb``
"
"" For full syntax highlighting:
""``let python_highlight_all=1``
""``syntax on``
"
"" Automatically indent based on file type: ``filetype indent on``
"" Keep indentation level from previous line: ``set autoindent``
"
" Folding based on indentation: ``set foldmethod=indent``


