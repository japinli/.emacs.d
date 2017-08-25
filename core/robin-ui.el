;;; robin-ui.el --- Robin's UI optimizations for Emacs.
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version: 0.1

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

(provide 'robin-ui)
