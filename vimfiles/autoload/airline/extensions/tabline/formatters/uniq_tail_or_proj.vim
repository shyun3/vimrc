function! airline#extensions#tabline#formatters#uniq_tail_or_proj#format(bufnr, buffers)
  " If only buffers are listed or project title does not exist, use unique_tail_improved
  if tabpagenr('$') < 2 || empty(getbufvar(a:bufnr, 'title'))
    return airline#extensions#tabline#formatters#unique_tail_improved#format(a:bufnr, a:buffers)
  else
    return getbufvar(a:bufnr, 'title')   " Use the project name from vim-project
endfunction


