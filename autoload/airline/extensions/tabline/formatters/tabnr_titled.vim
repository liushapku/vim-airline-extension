" MIT License. Copyright (c) 2017-2018 C.Brabandt et al.
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

function! s:TablineTitle(nr)
  let title = gettabvar(a:nr, 'tabline_title')
  if title != ''
    let title = printf('[%s]', title) . (g:airline_symbols.space)
  endif
  return title
endfunction

" g:airline#extensions#tabline#tabnr_formatter = 'IGNORE_tabnr_title'
" formatter for the tabnr
" :h airline => search for tab_nr_type
function! airline#extensions#tabline#formatters#IGNORE_tabnr_titled#format(tab_nr_type, tabnr)
  "let title = printf('%%{g:TablineTitle(%d)}', a:tabnr)
  let title = s:TablineTitle(a:tabnr)
  "let title = (g:airline_symbols.space).title
  if a:tab_nr_type == 1 " tabnr
    return title.a:tabnr . "==="
  if a:tab_nr_type == 0 " # number of splits
    return title.len(tabpagebuflist(a:tabnr))
  elseif a:tab_nr_type == 2 && tabpagenr('$') <= 8
    return title.a:tabnr.len(tabpagebuflist(a:tabnr))
  else
    return title.a:tabnr
  endif
endfunction
