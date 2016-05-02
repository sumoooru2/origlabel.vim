## origlabel.vim


## Usage
```vim
let g:origLabel#tabLabelFormat = ' %mod%num %name '
let g:origLabel#modified = '+'
let g:origLabel#notModified = ''
let g:origLabel#timeFormat = '%m/%d   '
set tabline=%!origlabel#tablabel()
```
