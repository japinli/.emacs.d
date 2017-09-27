;;; robin-ui.el --- Robin's UI optimizations for Emacs.
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version: 0.1

;; disable tool bar and menu bar
(when (fboundp 'tool-bar-mode)
	(tool-bar-mode -1))
(menu-bar-mode -1)

;; mode line settings
(column-number-mode t)

;; show line number at left buffer side
(require 'nlinum)
(global-nlinum-mode t)
(if (not (window-system))
    (setq nlinum-format "%d "))

;; show available keybindings after you entered incomplete command
(require 'which-key)
(which-key-mode)

(when robin-theme
  (load-theme robin-theme t))

(setq mode-line-position
  '((line-number-mode ("(%l" column-number-mode (",%c)")))))

(setq-default mode-line-format
  '("%e"
     " %b [%m] "
     mode-line-position))

(provide 'robin-ui)
