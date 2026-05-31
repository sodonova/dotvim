# Vim config

vim >= 7.4 will automaically load vimrc if this is in ~ and named .vim

On Windows had to clone into vimfiles directory:
```
$ git clone git@github.com:sodonova/dotvim.git vimfiles
```

If not, use the workflow:  
```
$ cd
$ git clone git@github.com:romainl/dotvim.git .vim
$ echo "runtime vimrc" > .vimrc
```
Shamelessly copied from https://stackoverflow.com/questions/18197705/adding-your-vim-vimrc-to-github-aka-dot-files

