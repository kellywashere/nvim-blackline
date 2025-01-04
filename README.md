# nvim-blackline

## Introduction
Nvim-blackline is a plugin that allows to specify two different colors for the CursorLine:
one for normal mode, and another for insert mode.

## Installation
Using [vim-plug](https://github.com/junegunn/vim-plug):

```viml
Plug 'kellywashere/nvim-blackline'
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use 'kellywashere/nvim-blackline'
```

## Usage
Somewhere in your nvim configuration, put
```
require('blackline').setup({opts})
```
Table `opts` can have the following fields:
| Option   | Description                            | Default                                     |
|----------|----------------------------------------|---------------------------------------------|
| `icolor` | The color of CursorLine in insert mode | The color from current color scheme         |
| `ncolor` | The color of CursorLine in normal mode | The color from current color scheme         |


## Example:
```
require('blackline').setup( { icolor = 'Black' } )
```
In this example, in normal mode ColorLine color is taken from the color scheme; in insert
mode, the CursorLine will be black instead.

Another example makes the CursorLine color dark blue in inert mode, and brighter blue in
normal mode:
```
require('blackline').setup( {icolor = '#000040', ncolor = '#0000d0'})
```
