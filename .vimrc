" Jessy's VIM config github.com/FishyG/dotfiles/.vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
if &compatible
        set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200     " keep 200 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set wildmenu        " display completion matches in a status line

set ttimeout        " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
 if has('reltime')
   set incsearch
 endif

" Enable syntax highlighting and auto indent
filetype plugin on
syntax on
filetype indent on
set autoindent

" Set the the number on the side of the editor
set relativenumber number

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" Only xterm can grab the mouse events when using the shift key, for other
" terminals use ":", select text and press Esc.
"if has('mouse')
"       if &term =~ 'xterm'
"               set mouse=a
"       else
"               set mouse=nvi
"       endif
"endif
set mouse=a

" Make Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if &term =~ '^screen'
        " tmux will send xterm-style keys when its xterm-keys option is on
        execute "set <xUp>=\e[1;*A"
        execute "set <xDown>=\e[1;*B"
        execute "set <xRight>=\e[1;*C"
        execute "set <xLeft>=\e[1;*D"
endif

" Go to next line when hitting the end of the line
set whichwrap=b,s,<,>,[,]

" Set the tab spacing to 4 space
set tabstop=4

" Add the termdebug package for ez debugging with GDB
packadd termdebug

" Set the fold parameter
set foldmethod=syntax
set foldmethod=indent
set foldlevel=1
