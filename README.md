## cinclude.vim
This is Vim Plugin for generate c include line

C言語のインクルード文をソースコードのトップに移動することなく追加します。

## installation
```vim
Plug 'homedm/cinclude.vim', { 'for': 'c' }
```

## Usage
do this command:
:CInclude \<head file name\>
add "#include\<head filename.h\>"


## Configure
g:cinclude\_start\_line
default: 1

g:cinclude\_last\_line
default: 50

CInclude search from g:cinclude\_start\_line to g:cinclude\_last\_line
