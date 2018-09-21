# Robin

Robin is a package manager for Emacs. This plugin is based on [bbatsov's prelude][] project.

## Dependencies

* markdown - Text to html conversion tool.
* [GUN GLOBAL][] - Source code tagging system.
* [YouCompleteMe][] -

## Emacs plugins

* [ace-window][] - Quickly switch windows in Emacs.
* [avy][] - Jump to things in Emacs tree-style.
* [counsel-gtags][] - [GNU GLOBAL][] interface of ivy.
* [editorconfig][] - Define and maintain code styles.
* [emamux][] - Let Emacs interact with [tmux][].
* [flymd][] - On the fly markdown preview.
* [helm-projectile][] - Helm UI for Projectile.
* [markdown-mode][] - Markdown-formatted text plugin for Emacs.
* [nlinum][] - Show line numbers in the margin.
* [projectile][] - Project interaction library for Emacs.
* [smartparens][] - Deal with parens pairs and tries to be smart about it.
* [swiper][] -  Flexible, simple tools for minibuffer completion in Emacs.
* [undo-tree][] - Treat undo history as a tree.
* [which-key][] - Display available keybindings in popup.
* [zop-to-char][] - A visual zap-to-char command for emacs.

## Global keybindings

 Keybindings | Description
:------------|:--------------
 M-p         | Switch window using ace-window
 C-c j       | Jump to specific character.
 C-x C-j     | Show current directory file list.
 C-c g       | Search using Google.
 C-c G       | Search using GitHub.
 C-c s       | Search using Stackoverflow.
 C-c p f     | Find a file in a project. More shortcuts see [projectile usage][].
 C-c g s     | Search for symbol references.
 C-c g r     | Search for references.
 C-c g d     | Search for definition.
 C-c g b     | Go to previous position in context stack.
 C-c g f     | Search for file among tagged files.
 F8          | Toggle NeoTree.
 C-t         | Emamux prefix key.

## Installation

This installation guide is for Ubuntu. First, clone `robin` to `.emacs.d` in
home directory. Make sure you backup your `.emacs.d`.

``` shell
$ cd ~ && git clone https://github.com/robin.git .emacs.d
```

Then, start emacs, it will install plugins. If you want to use YouCompleteMe to
complete your C/C++ code, use the following commands to install YouCompleteMe.

``` shell
$ sudo apt-get install libclang-dev python-dev cmake build-essential
$ cd /tmp && git clone https://github.com/Valloric/YouCompleteMe.git
$ cd YouCompleteMe && git submodule update --init --recursive
$ ./install.py --clang-completer
$ cd third_party && tar czf ycmd.tgz ycmd
$ mkdir ~/.local && mv ycmd.tgz ~/.local && cd ~/.local && tar xf ycmd.tgz
```

Finally, we should install `global` to generate symbols for C/C++ language.

``` shell
$ sudo apt-get install global
```

Enjoy yourself!

[bbatsov's prelude]: https://github.com/bbatsov/prelude
[ace-window]: https://github.com/abo-abo/ace-window
[avy]: https://github.com/abo-abo/avy
[counsel-gtags]: https://github.com/syohex/emacs-counsel-gtags
[editorconfig]: https://github.com/editorconfig/editorconfig-emacs
[flymd]: https://github.com/mola-T/flymd
[helm-projectile]: https://github.com/bbatsov/helm-projectile
[markdown-mode]: https://github.com/jrblevin/markdown-mode
[nlinum]: https://github.com/emacsmirror/nlinum
[projectile]: https://github.com/bbatsov/projectile
[smartparens]: https://github.com/Fuco1/smartparens
[swiper]: https://github.com/abo-abo/swiper
[undo-tree]: https://github.com/emacsmirror/undo-tree
[which-key]: https://github.com/justbur/emacs-which-key
[zop-to-char]: https://github.com/thierryvolpiatto/zop-to-char
[projectile usage]: https://github.com/bbatsov/projectile/blob/master/doc/usage.md
[GUN GLOBAL]: https://www.gnu.org/software/global/
[emamux]: https://github.com/syohex/emacs-emamux/
[tmux]: https://github.com/tmux/tmux
[YouCompleteMe]: https://github.com/Valloric/YouCompleteMe
