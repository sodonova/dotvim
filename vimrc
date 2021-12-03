" display line numbers on the sidebar
set number

" Display current line and column on the bottom bar
set ruler

" Set tabs to be 2 spaces wide
set tabstop=2
set shiftwidth=2

" Automatically indent code when going to the next line
set autoindent

" Expand tab characters to be spaces.
set expandtab

" highlight search results
set hlsearch

" start search without having to submit
set incsearch

" allow mouse for pasting etc
set mouse=a

"Keep 7 lines visible at the top and bottom of the screen when scrolling
set so=7

" use n and N to center the next search result on the screen
nmap n nzz
nmap N Nzz

" show whitespace -9/22/21 not showing so tabs aren't gross
" set list
" set listchars=tab:>.,trail:·

" wrap on whitespace only
set wrap linebreak breakat&vim

" Flash on the screen instead of making the bell sound
set noerrorbells
set visualbell

" remap ctrl-n to tab so it has intellij-like autocomplete
imap <Tab> <C-N>

filetype on
"syntax on

"set colorscheme to something tolerable
"colorscheme koehler

" documentation
command -nargs=1 Doc :botright term++close man -a <args>

" adding modern colorscheme: 
" 10/13 source https://github.com/joshdick/onedark.vim
" when removing it, uncomment syntax on and colorscheme koehler in addition to the below snippet.

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

" end modern colorscheme

" start powerline imitation but vanilla vim
" from https://www.tdaly.co.uk/post/vanilla-vim-statusline
"" statusline
set laststatus=2
set statusline=                          " left align
set statusline+=%2*\                     " blank char
set statusline+=%2*\%{StatuslineMode()}
set statusline+=%2*\                     "
set statusline+=%1*\ <<
set statusline+=%1*\ %f%m                " short filename and modified flag
set statusline+=%1*\ >>
set statusline+=%=                       " right align
set statusline+=%*
set statusline+=%3*\%h%r               " file flags (help, read-only, modified)
set statusline+=%4*\%{b:gitbranch}       " include git branch
set statusline+=%3*\%.25F                " long filename (trimmed to 25 chars)
set statusline+=%3*\::
set statusline+=%3*\%l/%L\\|             " line count
set statusline+=%3*\%y                   " file type
hi User1 ctermbg=black ctermfg=grey guibg=black guifg=grey
hi User2 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
hi User3 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen

"" statusline functions
function! StatuslineMode()
    let l:mode=mode()
    if l:mode==#"n"
        return "NORMAL"
    elseif l:mode==?"v"
        return "||||||||||VISUAL"
    elseif l:mode==#"i"
        return "INSERT///////////////////////"
    elseif l:mode==#"R"
        return "REPLACE"
    endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    lcd %:p:h
    let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
    lcd -
    if l:gitrevparse!~"fatal: not a git repository"
      let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
    endif
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END
" end powerline imitation
