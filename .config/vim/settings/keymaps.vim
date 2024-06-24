
" normal mode keymap

nnoremap qq <cmd>qa!<CR>
nnoremap q <cmd>q<CR>
nnoremap <C-l> e
nnoremap <C-h> b
vnoremap <C-l> e
vnoremap <C-h> b

" Delete backwords
nnoremap dw vb"_d

" Delete blackhole
nnoremap  dd "_dd

" Select All
nnoremap <C-a> gg<S-V>G

" Split window
nnoremap ss <cmd>split<CR>
nnoremap sv <cmd>vsplit<CR>

" Tabmode
nnoremap <silent> <C-n> <cmd>tabnew<CR>
nnoremap <silent> <Tab> <cmd>tabnext<CR>
nnoremap <silent> <S-Tab> <cmd>tabprevious<CR>

" Moving window
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

" Scroll up and down
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>


