# Vim as VSCode
VSCode recently stopped working on my lab computer, so I've set up Vim to act as VSCode.  
Here are the relevant commands:

Tabs: `:tabe <file>` navigate with mouse, drag with mouse. `ctrl+PgDn/Up` to navigate tabs.  
Split screen: `:vsplit <file>`  
Terminal:`:tab term`, `:tab term++close man 3 <something>`, `:botright term` to split to bottom across all vsplits like vscode, `:rightb vert term` to split
vertically to the right.  
In the terminal `ctrl+\,ctrl+n` to exit insert mode in order to type commands. `ctrl+w, ctrl+w` to switch active screens.

In general `rightb`, `vert`, and `botright` are modifiers on commands, so you can use them with something other than term.

`gD` or `gd` to jump to function/variable declaration, but only really searches for first instance of the string.

`autocmd TextChanged,TextChangedI <buffer> silent write` to turn on autosave, https://stackoverflow.com/questions/17365324/auto-save-in-vim-as-you-type
