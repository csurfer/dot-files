"Apply solarized theme on vim.
let g:solarized_termcolors=256
set nofoldenable
syntax enable

"Choose dark subtype of solarized theme.
set background=dark
colorscheme solarized

"Shortcut to search Google from vim.
Bundle 'szw/vim-g'
map <Leader>g :Google<CR>
map <Leader>gf :Googlef<CR>

"Shortcut to search StackOverflow from vim.
Bundle 'hienvd/vim-stackoverflow'

"Shortcut to enable vimum.
Bundle 'benmills/vimux'
"Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
"Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>