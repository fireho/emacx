# Emacx / Emacs Dotfiles

Lots of modes and shortcuts to code in emacs fast and -fun- furious.


## C-c Install

Make a symbolic link (recommended):

    git clone git://github.com/fireho/emacx
    cd emacx && ln -s `pwd`/.emacs.d ~/.emacs.d

Just move to home:

    git clone git://github.com/fireho/emacx
    mv emacx ~/.emacs.d

Or use the install script:

    git clone git://github.com/fireho/emacx
    cd emacx && ./install

## Recompile!

To make loading really fast, **M-x** `byte-recompile-home`.


### Fonts

Monaco/Inconsolata/Hack suggestions.

    cp -r .fonts ~
    sudo fc-cache -vf

Archlinux:

    pacman -S ttf-inconsolata monaco-linux-font


## Emacs

Start with the tutorial on Help => Emacs Tutorial

For the lazy, check out /dev/null


## Includes

* C / Ruby / Rails / Rspec Modes
* JS2 / CoffeeScript
* Haml / HTML / CSS Modes
* Snippets
* Magit
* Linum
* Themes
* Free p0rn!


## Shortcuts (Mini linux textmate.el)

* M-/  =>  comment-or-uncomment-region
* M-[  =>  indent-region
* M-]  =>  indent-according-to-mode
* M-s  =>  save-buffer
* M-t  =>  ido-find-file
* M-w  =>  ido-switch-buffer
* M-q  =>  kill-this-buffer
* M-a  =>  magit-status
* M-b  =>  magit-branch
* M-r  =>  query-replace
* M-S-r  =>  query-replace global

* C-o  =>  occur
* C-s  =>  isearch-forward-regex

## Byte compile

Run when you update/make changes to your config:

    M-x byte-recompile-home


# Português

## O que é?

Uma reunião de  plugins e configurações pra deixar o Emacs  pronto pra usar.

## Ok, gostaria de começar a utilizar o Emacs, como devo proceder?

Siga os comandos no topo desse tutorial pra instalar.

Inicie pelo tutorial incluso no Editor, em Help => Emacs Tutorial


## Emacs é somente para nerds e é muito díficil, o que devo fazer?

Por favor, verifique o manual para preguiçosos do mesmo em /dev/null.
