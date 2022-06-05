syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number relativenumber
set nu rnu
set smartcase
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set exrc
set secure
set backspace=indent,eol,start

set colorcolumn=80
" Keep cursor in middle of screen
set so=999
highlight ColorColumn ctermbg=30 guibg=lightgrey

filetype plugin on
set nocompatible

""inoremap " ""<left>
""inoremap ' ''<left>
""inoremap ( ()<left>
""inoremap [ []<left>
""inoremap { {}<left>
""inoremap {<CR> {<CR>}<ESC>O
""inoremap {;<CR> {<CR>};<ESC>O

" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar


"if &term =~ '^xterm'
"    autocmd VimEnter * silent !echo -ne "\<Esc>[1 q"
"    " normal mode
"    let &t_EI .= "\<Esc>[1 q"
"    " insert mode
"    let &t_SI .= "\<Esc>[1 q"
"endif

call plug#begin()

"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" For vsnip user.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
call plug#end()

let g:python3_host_prog = '/usr/local/bin/python3'

colorscheme onedark
highlight Normal guibg=NONE ctermbg=NONE

" Allow rg to always detect your root
" Also, use your .gitignore for faster searching
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader=" "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25
let g:ctrlp_use_caching=0

" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

" UltiSnips keymaps
"let g:UltiSnipsSnippetsDir="/Users/kweedop/.vim/UltiSnips"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""" Vimwiki configuration
" set path to vimwiki and make the syntax markdown
let g:vimwiki_list = [{'path': '/Users/kweedop/OneDrive\ -\ Research\ Triangle\ Institute/work-wiki/', 'syntax': 'markdown', 'ext': '.md'}]
" Associate the various file extensions to markdow syntax
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown', '.wiki': 'markdown'}
" Makes vimwiki markdown links as [text](text.md) rather than [text](text)
let g:vimwiki_markdown_link_ext = 1
" To use alternating colors for the heading levels
let g:vimwiki_hl_headers = 1
nnoremap <leader>pdf :!markdown-pdf %<ENTER>

nnoremap <leader>wt :Rg<SPACE>::<left>

""" vim-markdown configuration
let g:markdown_folding = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

""" YCM configuration
"let g:ycm_filetype_blacklist = {'markdown': 1}

" External command for date
nnoremap <leader>now i <C-r>=strftime('%Y-%m-%d')<CR>
" Go to the left window
nnoremap <leader>h :wincmd h<CR>
" Go to the right window
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Show the undotree
nnoremap <leader>u :UndoTreeShow<CR>
" Open directory and resize window to 30%
"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 20<CR>

" keymap to focus current buffer
nnoremap <leader>wo <C-w>o

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" NerdTree keymaps
nnoremap <leader>nt :NERDTreeFocus<CR>
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>

" Rip grep 
nnoremap <leader>rg :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
" Terminal shortcut
nnoremap <leader>tt :term<CR>

" vimwiki shortcuts
nnoremap <leader>ws :VimwikiSearch<SPACE>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprevious<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Probably move to php.vim
" nnoremap <leader>a a->
" nnoremap <leader>kv a<space>=><space>

" Copy visual selection to machine clipboard
vmap <leader>cp :w !pbcopy<CR><CR>
set completeopt=menu,menuone,noselect

lua <<EOF
-- Setup nvim-cmp.
local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip usr.
      { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
    }
  })

-- Typescript/Javascript server
require'lspconfig'.tsserver.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
-- Vue server
require'lspconfig'.vuels.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
-- PHP
require'lspconfig'.intelephense.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

-- YAML server
require'lspconfig'.yamlls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
-- R server
require'lspconfig'.r_language_server.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

-- HTML server
require'lspconfig'.html.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

EOF
