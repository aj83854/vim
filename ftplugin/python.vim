" File ~/.vim/ftplugin/python.vim
" Python specific settings
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql
setlocal fileformat=unix

" Specifiy python linters enabled for ALE
let b:ale_linters = ['pylint', 'autopep8']

" Python's pipenv detection
if shell_error == 0
  let g:ale_python_pylint_auto_pipenv = 1
  let g:ale_python_auto_pipenv = 1  
endif
