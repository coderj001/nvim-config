"                         █████████████████▀▀▀▀░░░░░░░░░▀▀▀▀████████████████
"                         ██████████████▀░░░░░░░░░░░░░░░░░░░░░▀█████████████
"                         █████████████│░░░░░░░░░░░░░░░░░░░░░░░│████████████
"                         ████████████▌│░░░░░░░░░░░░░░░░░░░░░░░│▐███████████
"                         ████████████░└┐░░░░░░░░░░░░░░░░░░░░░┌┘░███████████
"                         ████████████░░└┐░░░░░░░░░░░░░░░░░░░┌┘░░███████████
"                         ████████████░░┌┘▄▄▄▄▄▄░░░░░░░▄▄▄▄▄▄└┐░░███████████
"                         ████████████▌░│███████▌░░░░░▐███████│░▐███████████
"                         ████████████▌░│███████▌░░░░░▐███████│░▐███████████
"                         █████████████░│▐████▀▀░░▄▄▄░░▀▀████▌│░████████████
"                         ████████████▀─┘░░░░░░░░▐███▌░░░░░░░░└─▀███████████
"                         ████████████▄░░░▄▄▄▄▓░░▀███▀░░▓▄▄▄▄░░░▄███████████
"                         ██████████████▄─┘███▌░░░░░░░░░▐███└─▄█████████████
"                         ███████████████░░▌▐█─┬┬┬┬┬┬┬┬┬─█▌▌░░██████████████
"                         ██████████████▌░░░░▀┬┼┼┼┼┼┼┼┼┼┬▀░░░░▐█████████████
"                         ██████████████▌░░░░▀┬┼┼┼┼┼┼┼┼┼┬▀░░░░▐█████████████
"                         ███████████████▄░░░░└┴┴┴┴┴┴┴┴┴┘░░░░▄██████████████
"                         █████████████████▄▄░░░░░░░░░░░░░▄▄████████████████
"                         █████████████████████▄▄▄▄▄▄▄▄▄████████████████████
"                         ██████████████████████████████████████████████████
"
" Vim-Plug core
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" polyglot
" let g:polyglot_disabled = ['jsx', 'tsx', 'markdown', 'markdown.plugin']
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Plugin
call plug#begin(expand('~/.vim/plugged'))
" FILE MANAGER, BUFFER AND TABS
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-scripts/BufOnly.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'kien/tabman.vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'andymass/vim-matchup'
Plug 'junegunn/vim-peekaboo'
Plug 'tweekmonster/startuptime.vim'
Plug 'tc50cal/vim-terminal'
" UI
Plug 'ajmwagar/vim-deus', {'branch': 'master'}
Plug 'ekalinin/Dockerfile.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'tmhedberg/SimpylFold'
Plug 'tribela/vim-transparent'
" CODE
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'tomtom/tcomment_vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'honza/vim-snippets'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'fvictorio/vim-extract-variable'
Plug 'FooSoft/vim-argwrap'
call plug#end()

" vim-matchup
let g:loaded_matchit = 1

" NerdTree config

" enable line numbers
let NERDTreeShowLineNumbers=1
" vim-nerdtree-syntax-highlight
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules', '\.out$', '\.exe$', '.git']
let g:NERDTreeSortOrder=['^__\.py$','^__\.jsx$','^__\.js$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeStatusline = 'NERDTreeExplorer'
let g:NERDTreeShowBookmarks=1
let g:NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:nerdtree_tabs_focus_on_files=1

autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" With a map leader it's possible to do extra key combinations
let mapleader = ","

" mnt/jsx
let g:jsx_ext_required = 1

" maxmellon/vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag =  1

" SimpylFold
let g:SimpylFold_docstring_preview = 1

" Emmet config
let g:user_emmet_install_global = 0
let g:user_emmet_mode='i'
autocmd FileType html,htmldjango,scss,css,vue,jsx,javascriptreact,typescriptreact,javascript.jsx EmmetInstall
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" indentLine
let g:indent_blankline_filetype_exclude = ['help', 'vim']
let g:indent_blankline_space_char = '|'
let g:indentLine_char_list = ['|']
let g:indentLine_char = '|'

" fugitive
let g:fugitive_dynamic_colors = 1

" Tabman
let g:tabman_toggle = '<leader>mm'
let g:tabman_focus  = '<leader>mn'
let g:tabman_width = 30
let g:tabman_side = 'right'
let g:tabman_number = 1
let g:tabman_specials = 1

" FZF config
" Files + devicons + floating fzf
function! FzfFilePreview()
  let l:fzf_files_options = '--preview "batcat --theme="1337" --style=numbers,changes --color always {3..-1} | head -200" --expect=ctrl-v,ctrl-x'
  let s:files_status = {}

  function! s:cacheGitStatus()
    let l:gitcmd = 'git -c color.status=false -C ' . $PWD . ' status -s'
    let l:statusesStr = system(l:gitcmd)
    let l:statusesSplit = split(l:statusesStr, '\n')
    for l:statusLine in l:statusesSplit
      let l:fileStatus = split(l:statusLine, ' ')[0]
      let l:fileName = split(l:statusLine, ' ')[1]
      let s:files_status[l:fileName] = l:fileStatus
    endfor
  endfunction

  function! s:files()
    call s:cacheGitStatus()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_indicators(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:prepend_indicators(candidates)
    return s:prepend_git_status(s:prepend_icon(a:candidates))
  endfunction

  function! s:prepend_git_status(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:status = ''
      let l:icon = split(l:candidate, ' ')[0]
      let l:filePathWithIcon = split(l:candidate, ' ')[1]

      let l:pos = strridx(l:filePathWithIcon, ' ')
      let l:file_path = l:filePathWithIcon[pos+1:-1]
      if has_key(s:files_status, l:file_path)
        let l:status = s:files_status[l:file_path]
        call add(l:result, printf('%s %s %s', l:status, l:icon, l:file_path))
      else
        " printf statement contains a load-bearing unicode space
        " the file path is extracted from the list item using {3..-1},
        " this breaks if there is a different number of spaces, which
        " means if we add a space in the following printf it breaks.
        " using a unicode space preserves the spacing in the fzf list
        " without breaking the {3..-1} index
        call add(l:result, printf('%s %s %s', ' ', l:icon, l:file_path))
      endif
    endfor

    return l:result
  endfunction

  function! s:edit_file(lines)
    if len(a:lines) < 2 | return | endif

    let l:cmd = get({'ctrl-x': 'split',
                 \ 'ctrl-v': 'vertical split',
                 \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')

    for l:item in a:lines[1:]
      let l:pos = strridx(l:item, ' ')
      let l:file_path = l:item[pos+1:-1]
      execute 'silent '. l:cmd . ' ' . l:file_path
    endfor
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink*':   function('s:edit_file'),
        \ 'options': '-m --preview-window=right:70%:noborder --prompt Files\> ' . l:fzf_files_options,
        \ 'down':    '40%',
        \ 'window': 'call FloatingFZF()'})

endfunction
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!node_modules/**' --glob '!vendor/bundle/**'"
let g:fzf_tags_command = 'ctags --exclude=.git --exclude=node_modules --exclude=.venv -R'
let g:fzf_history_dir = '~/.local/share/fzf-history'

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --hidden --glob '!.git/**' --glob '!build/**' --glob '!node_modules/**' --glob '!vendor/bundle/**' --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" KeyBinding - FZF
noremap <C-x> :Files<cr>
noremap <silent> <leader>/ :BLines<cr>
noremap <silent> <leader>l :Lines<cr>
noremap <silent> <leader>k :Rg<cr>
noremap <silent> <leader>j :BTags<cr>
noremap <silent> <leader>h :Tags<cr>
noremap <silent> <leader>; :GFiles<cr>
noremap <silent> <leader>b :Buffers<cr>
noremap <silent> <leader>: :Commands<CR>
noremap <silent> <leader>p :Format<CR>
noremap <silent> <leader>aw :ArgWrap<CR>

nnoremap <silent> <A-z> :Helptags<CR>
nnoremap <silent> <A-f> :Filetypes<CR>
nnoremap <silent> <A-m> :Marks<CR>
nnoremap <silent> <A-w> :Windows<CR>
nnoremap <silent> <A-b> :BOnly<CR>

nnoremap <silent> <A-q> :bdelete<CR>
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <space><TAB> :bprevious<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" vim-devicons
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package-lock.json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.env'] = 'ﭩ'

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = 'ﬥ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ts'] = 'ﯤ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''

" NERDTreeToggles
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader><leader>h :sp<CR>
nnoremap <leader><leader>v :vsp<CR>

" AirLine

let g:airline_mode_map = {
\ '__'     : '-',
\ 'c'      : 'C',
\ 'i'      : 'I',
\ 'ic'     : 'I',
\ 'ix'     : 'I',
\ 'n'      : 'N',
\ 'multi'  : 'M',
\ 'ni'     : 'N',
\ 'no'     : 'N',
\ 'R'      : 'R',
\ 'Rv'     : 'R',
\ 's'      : 'S',
\ 'S'      : 'S',
\ ''     : 'S',
\ 't'      : 'T',
\ 'v'      : 'V',
\ 'V'      : 'V',
\ ''     : 'V',
\ }
let g:airline_extensions = ['branch', 'tabline', 'coc', 'fzf', 'keymap', 'quickfix', 'netrw', 'undotree', 'wordcount', 'whitespace', 'term']
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fzf#enabled = 1
" let g:airline_section_a = "🚀coderj001"
let g:airline_section_a = airline#section#create(['[','mode', ']', 'coderj001'])
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'warning', 'error', 'z']]
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

" Vim-Airline Configuration
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#capslock#symbol = '⇪'
let g:airline_stl_path_style = 'short'
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:webdevicons_enable_startify = 1
let g:airline_theme='deus'
let g:airline_left_sep = "\uE0B8"
let g:airline_right_sep = "\uE0BA"
let g:airline_left_alt_sep = '»'
let g:airline_right_alt_sep = '«'
let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline_detect_paste=1
let g:airline#extensions#paste#symbol      = 'ρ'

" AirLine Tabline

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab10


" color
set background=dark
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    hi LineNr ctermbg=NONE guibg=NONE
endif

if has('gui_running')
    colorscheme deus
else
    colorscheme deus
endif

" GitGutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '~'
let g:gitgutter_sign_removed            = 'x'
let g:gitgutter_sign_removed_first_line = 'x'
let g:gitgutter_sign_modified_removed   = '~'
let g:gitgutter_preview_win_floating = 1

let g:gitgutter_enabled = 1
let g:gitgutter_enabled = 1

noremap <silent><M-g> :GitGutterLineHighlightsToggle<cr>

highlight GitGutterAdd    guifg=#004524 ctermfg=2
highlight GitGutterChange guifg=#0F41F7 ctermfg=3
highlight GitGutterDelete guifg=#94151B ctermfg=1

" FORMATTERS
au BufNewFile,BufRead *.html set filetype=htmldjango


let pipenv_venv_path = system('pipenv --venv')

" startify

let g:startify_custom_header = [
            \ '       ███╗   ██╗██╗   ██╗ ██████╗ ██████╗ ██████╗ ███████╗',
            \ '       ████╗  ██║██║   ██║██╔════╝██╔═══██╗██╔══██╗██╔════╝',
            \ '       ██╔██╗ ██║██║   ██║██║     ██║   ██║██║  ██║█████╗  ',
            \ '       ██║╚██╗██║╚██╗ ██╔╝██║     ██║   ██║██║  ██║██╔══╝  ',
            \ '       ██║ ╚████║ ╚████╔╝ ╚██████╗╚██████╔╝██████╔╝███████╗',
            \ '       ╚═╝  ╚═══╝  ╚═══╝   ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝',
            \ '                                                            ',
            \ '                                     User : coderj001',
        \]


let g:startify_session_dir = '~/.vim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
let g:startify_bookmarks = [
            \ { 'i': '~/.vimrc' },
            \ { 'z': '~/.zshrc' },
            \ { 't': '~/.tmux.conf' },
            \ { 'c': '~/.config/kitty/kitty.conf' },
            \ { 'a': '~/.config/alacritty/alacritty.yaml' },
            \ ]
let g:startify_enable_special = 0

" vim-easymotion
"Just to get it unmapped from <Leader><Leader>
nnoremap <leader>F <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <leader><leader>l <Plug>(easymotion-bd-jk)
nmap <leader><leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <silent><nowait> <space>f <Plug>(easymotion-bd-w)
nmap <silent><nowait> <space>f <Plug>(easymotion-overwin-w)
nmap <silent><nowait> <space>w <Plug>(easymotion-w)
nmap <silent><nowait> <space>b <Plug>(easymotion-b)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))


" PLUGIN'S END

" MY CUSTOM
" Use alt + hjkl to resize windows
nnoremap <silent> <up>    :resize -1<CR>
nnoremap <silent> <down>    :resize +1<CR>
nnoremap <silent> <right>    :vertical resize -1<CR>
nnoremap <silent> <left>    :vertical resize +1<CR>

" General
set t_Co=256
" Set number of line
set number
" Set Relative Number On
set relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

au BufWritePre * :%s/\s\+$//e     " remove trailing whitespaces before saving
au InsertEnter * :normal zz       " move to center while editing

" Set modifier on
set ma
" Set Cursor Line On
autocmd BufEnter * set cursorline
" Sets how many lines of history VIM has to remember
set history=500

set guifont=Fira\ Code\ Nerd\ Font:h10

" Mapping quite command
cabbr Q q
cabbr Q! q!
cabbr W! w!
cabbr W w
cabbr WA wa
cabbr Wa wa
cabbr Wq wq
cabbr WQ wq
cabbr Qa qa
cabbr QA qa
cabbr Wqa wqa

" Vimrc
nnoremap <leader>ei :e $MYVIMRC<cr>
nnoremap <leader>ee :source $MYVIMRC<cr>
" Enable filetype plugins
filetype plugin on
filetype indent on
" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime
" Fast saving
nmap <leader>w :w!<cr>
" VIM user interface
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" Better indenting
vnoremap < <gv
vnoremap > >gv
" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" Avoid garbled characters in Chinese language Windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" lazy file name tab completion
set wildmode=longest,list,full
set wildmenu
set wildignorecase

" ignore files vim doesnt use for lazy file completion
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

" requires a patched nerd font (try FiraCode)
set fillchars+=vert:\▏
" tab title as file name
set title
" set this so we wont break indentation plugin
set conceallevel=2
" open vertical split to the right
set splitright
" open horizontal split to the bottom
set splitbelow
" Use ripgrep for grepprg (vim search)
set grepprg=rg\ --vimgrep
"Always show current position
set ruler
" Height of the command bar
set cmdheight=2
" A buffer becomes hidden when it is abandoned
set hid
" Configure backspace, so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
" set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" No annoying sound on errors
set noerrorbells
set novisualbell
" For undo
if has('persistent_undo')
    set undodir=~/.vim/undodir
    set undofile
    set undolevels=10000
endif
set tm=500
" Properly disable sound on errors on MacVim
if has("gui_macvim")
autocmd GUIEnter * set vb t_vb=
endif
" Add a bit of extra margin to the left
set foldcolumn=1
" Folding set foldmethod=indent
set foldmethod=indent
set foldnestmax=10
" set nofoldenable
set foldlevel=2
set exrc
" suggest height
set pumheight=20
" Colors and Fonts
" Enable syantax highlighting
syntax enable
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
scriptencoding utf-8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Files, backups and undo
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
" COC Change
" set signcolumn=yes
" Text, tab and indent related
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
" Moving around, tabs, windows and buffers
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"Editing mappings
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Esc KeyBind
inoremap jk <esc>
" esc disable
inoremap <esc> <nop>
" Backspace disable
inoremap <bs> <nop>
" Hide split window
noremap <leader>aa :hide<cr>
" Turn pellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md,*.txt setlocal spell
  set spellfile=~/.vim/spell/en.utf-8.add
  autocmd BufNewFile,BufRead *.md,*.txt setlocal dictionary+=/usr/share/dict/words
  autocmd BufNewFile,BufRead *.md,*.txt setlocal thesaurus+=~/.vim/thesaurus/thesaurii.txt
augroup END
" Javascript config files
autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc,.tern-project,.prettierrc set ft=json

" COC config
" coc

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorMoved * if &previewwindow != 1 | pclose | endif

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fx  <Plug>(coc-format-selected)
nmap <leader>fx  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to foldcurrent buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" list of service active
nnoremap <silent><nowait> <space>l  :<C-u>CocList services<CR>
" coc end.

" Coc snippet
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

nnoremap <silent><nowait> <space>n  :<C-u>CocList snippets<CR>
nnoremap <silent><nowait> <space>se  :<C-u>CocCommand snippets.editSnippets<CR>
nnoremap <silent><nowait> <space>so  :<C-u>CocCommand snippets.openSnippets<CR>
" coc snippet end

" Terminal
let g:Terminal_PyVersion = 3

" Snips
let g:snips_author='coderj001'
let g:snips_github='http://github.com.coderj001'
let g:snips_email='coderj001@gmail.com'
let g:python3_host_prog = '/usr/bin/python3'

let g:coc_global_extensions = [
      \'coc-go',
      \'coc-pyright',
      \'coc-json',
      \'coc-tsserver',
      \'coc-snippets',
      \]
