" .vim directory
if has("win32")
  let s:vim_dir = expand("$HOME") . "/vimfiles"
else
  let s:vim_dir = "~/.vim"
endif

packadd minpac

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.

" Colors
call minpac#add('tomasr/molokai')

" Plugins
call minpac#add('shyun3/ctrlp.vim', {'branch': 'pullreq'})
call minpac#add('tpope/vim-sensible')
call minpac#add('nelstrom/vim-visual-star-search')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('amiorin/vim-project', {'type': 'opt'})
call minpac#add('scrooloose/nerdtree')
call minpac#add('inside/vim-search-pulse')
call minpac#add('vim-airline/vim-airline')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-repeat')
call minpac#add('Valloric/YouCompleteMe', {'do': '!git submodule update --init --recursive'})
call minpac#add('yssl/QFEnter')
call minpac#add('tpope/vim-surround')
call minpac#add('bkad/CamelCaseMotion', {'type': 'opt'})
call minpac#add('majutsushi/tagbar')
call minpac#add('SirVer/ultisnips')
call minpac#add('mhinz/vim-grepper', {'type': 'opt'})
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('PProvost/vim-ps1')
call minpac#add('vim-scripts/DoxygenToolkit.vim')
call minpac#add('junegunn/vim-easy-align')
call minpac#add('vimwiki/vimwiki')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('nathanaelkane/vim-indent-guides')
call minpac#add('Cognoscan/vim-vhdl')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('mustache/vim-mustache-handlebars')
call minpac#add('heavenshell/vim-jsdoc')
call minpac#add('ludovicchabant/vim-gutentags')
call minpac#add('sjl/gundo.vim')
call minpac#add('tpope/vim-projectionist')
call minpac#add('shyun3/vim-cmake-lists')

" Text objects
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-entire')
call minpac#add('glts/vim-textobj-comment')
call minpac#add('fvictorio/vim-textobj-backticks')
call minpac#add('kana/vim-textobj-indent')

set encoding=utf-8

" Project
let g:project_use_nerdtree = 1
packadd vim-project
call project#rc()
execute "silent! source " . s:vim_dir . "/projects.vim"

let c_gnu=1              " Highlight GNU keywords
" let g:c_syntax_for_h = 1 " Set .h files to C filetype

set number            " Line numbers
set hlsearch          " Highlight all search results
set nowrap            " Do not wrap text
set autowriteall      " Save when switching buffers
set ignorecase        " Ignore case when searching
set smartcase         " Consider case when an uppercase character is being used
set splitright        " All vertical splits open to the right
set splitbelow        " All horizontal splits open below
set colorcolumn=80    " Show right margin
set listchars=tab:»\ ,trail:·,precedes:◄,extends:► " Set invisibles
set list                                           " Show invisibles
set cursorline
set noswapfile

" undofile
set undofile
let &undodir = s:vim_dir . "/undo"

" Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

" Tabs
set expandtab     " Change tabs to spaces
set tabstop=2     " Number of spaces in a tab
set softtabstop=2 " Tab stop positions for spaces
set shiftwidth=2  " Indentation width

" C indent options
set cinoptions=g0   " Don't indent class scope declarations
set cinoptions+=N-s " Don't indent contents of namespace

augroup myAutosaveGroup
  autocmd!
  autocmd BufLeave,FocusLost * silent! update   " Save when leaving buffer
augroup END

" Mappings
" Make & keep sub flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Make Y behave like C and D
nnoremap Y y$

" Open tags in splits
nnoremap <C-]> :tjump /\<<C-R><C-W>\>\C<CR>
if has("win32")
  nnoremap <A-]>s :wincmd g<C-V><C-]><CR>
  nnoremap <A-]>v :vertical wincmd g<C-V><C-]><CR>
else
  nnoremap ‘s :wincmd g<C-V><C-]><CR>
  nnoremap ‘v :vertical wincmd g<C-V><C-]><CR>
endif

" Run simple build
nnoremap <F6> :call SimpleBuild(getcwd() . "/vimbuild.sh")<CR>

function! SimpleBuild(filepath)
  " Prepare command appropriate for OS
  if has("win32")
    let l:prefix = '!start /b '
  else
    let l:prefix = '!'
  endif

  " Run file if possible
  if filereadable(a:filepath)
    execute l:prefix . a:filepath
  else
    " Generate cscope
    execute l:prefix . 'cscope -R -b'
  endif
endfunction

" Open current file in explorer
if has("win32")
  nnoremap <F10> :!start explorer /select,%:p<CR>
else
  nnoremap <F10> :!open -R %<CR>
endif

" Open file in Chrome
if has("win32")
  nnoremap <F5>
    \ :!start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    \ "%:p"<CR>
elseif has("macunix")
  nnoremap <F5> :!open -a "Google Chrome.app" "%:p"<CR>
elseif has("unix")
  nnoremap <F5> :exe ':silent !google-chrome %:p'<CR>
endif

" Window navigation
nnoremap <silent> ]w :wincmd w<CR>
nnoremap <silent> [w :wincmd W<CR>
nnoremap <silent> <BS> :wincmd p<CR>
nnoremap <silent> <Left> :wincmd h<CR>
nnoremap <silent> <Down> :wincmd j<CR>
nnoremap <silent> <Up> :wincmd k<CR>
nnoremap <silent> <Right> :wincmd l<CR>
if !has("macunix")
  nnoremap <silent> <A-c> :wincmd c<CR>
  nnoremap <silent> <A-q> :botright copen<CR>
  nnoremap <silent> <A-o> :wincmd o<CR>
  nnoremap <silent> <A-1> :1wincmd w<CR>
  nnoremap <silent> <A-2> :2wincmd w<CR>
  nnoremap <silent> <A-3> :3wincmd w<CR>
else
  nnoremap <silent> ç :wincmd c<CR>
  nnoremap <silent> œ :botright copen<CR>
  nnoremap <silent> ø :wincmd o<CR>
  nnoremap <silent> ¡ :1wincmd w<CR>
  nnoremap <silent> ™ :2wincmd w<CR>
  nnoremap <silent> £ :3wincmd w<CR>
endif

" Set current directory to project root
if !has("macunix")
  nnoremap <A-n> :exe "cd " . g:NERDTreeFileNode.GetRootForTab().path.str()<CR>
else
  nnoremap ˜ :execute "cd " . g:NERDTreeFileNode.GetRootForTab().path.str()<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_switch_buffer = 0     " Always open a new instance
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'autoignore']
let g:ctrlp_user_command = 'rg --files -F --color never --hidden --follow -g "!.*/" %s'
let g:ctrlp_by_filename = 1       " Search filenames by default
let g:ctrlp_buftag_ctags_bin = 'univ_ctags'
let g:ctrlp_buftag_types = {
  \ 'arduino': '--language-force=c++',
\}
let g:ctrlp_working_path_mode = ''

nnoremap <C-\> :CtrlPBuffer<CR>
nnoremap <C-H> :CtrlPTag<CR>
nnoremap <C-K> :CtrlPBufTag<CR>
nnoremap Q :CtrlPQuickfix<CR>
if !has("macunix")
  nnoremap <A-p> :CtrlPMRU<CR>
else
  nnoremap π :CtrlPMRU<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
let g:EasyMotion_do_mapping = 0            " Disable default mappings
let g:EasyMotion_re_anywhere = '\v(<.|^$)' " Beginning of word
let g:EasyMotion_startofline = 0           " Keep cursor column JK motion
map _ <Plug>(easymotion-s)
map <C-J> <Plug>(easymotion-bd-jk)
nmap <Space> <Plug>(easymotion-jumptoanywhere)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Tree
nnoremap <silent> <C-n> :NERDTree<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope
set cscopetag                " Search tags and cscope
set cscopetagorder=1         " Order in which tags and cscope are searched
set cscopequickfix=s-,c-,g-  " Clear quickfix list and add cscope results
nnoremap <C-_>s :call CscopeFind("<cword>", "s")<CR>
nnoremap <C-_>c :call CscopeFind("<cword>", "c")<CR>
nnoremap <C-_>g :call CscopeFind("<cword>", "g")<CR>

function! CscopeFind(name, querytype)
  cscope add cscope.out
  execute "cscope find " . a:querytype . " " . a:name
  cscope kill cscope.out
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search pulse
let g:vim_search_pulse_mode = 'pattern'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QFEnter (use CtrlP mappings)
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0 " Whitespace error detection
let g:airline#extensions#tagbar#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'uniq_tail_or_proj'
let g:airline#extensions#tabline#fnamemod = ':t'   " Default tab name formatter
let g:airline#extensions#tabline#fnamecollapse = 0 " Short parent names in tabs
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1

nnoremap <silent> <leader>; :YcmCompleter GoToDeclaration<CR>
nnoremap <silent> <leader>s; :sp<CR>:YcmCompleter GoToDeclaration<CR>
nnoremap <silent> <leader>v; :vsp<CR>:YcmCompleter GoToDeclaration<CR>

nnoremap <silent> <leader>] :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>s] :sp<CR>:YcmCompleter GoTo<CR>
nnoremap <silent> <leader>v] :vsp<CR>:YcmCompleter GoTo<CR>

nnoremap <silent> <leader>t :YcmCompleter GetType<CR>
nnoremap <silent> <leader>p :YcmCompleter GetParent<CR>
nnoremap <silent> <leader>? :YcmCompleter GetDoc<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
let g:tagbar_autofocus = 1    " Move to Tagbar window when opened
let g:tagbar_sort = 0
if !has("macunix")
  nmap <A-t> :TagbarToggle<CR>
else
  nmap † :TagbarToggle<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<A-f>"
let g:UltiSnipsJumpBackwardTrigger="<A-b>"

let g:UltiSnipsEditSplit = 'horizontal'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grepper
packadd vim-grepper
runtime plugin/grepper.vim
let g:grepper.tools = ['rg', 'git']
let g:grepper.rg.grepprg .= ' --smart-case --follow'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CamelCaseMotion
packadd CamelCaseMotion
call camelcasemotion#CreateMotionMappings(',')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'project',
  \ 'markdown']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']   " Work with fugitive

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Handlebars
let g:mustache_operators = 0  " Disable text objects

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSDoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_return_description = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gutentags
let g:gutentags_ctags_executable = 'univ_ctags'
let g:gutentags_ctags_exclude = ['node_modules', 'bower_components']

" ctags --fields=+l is needed for YCM parsing
let g:gutentags_ctags_extra_args = ['--fields=+l']
