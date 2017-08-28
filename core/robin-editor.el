;;; robin-editor.el --- Robin's editor configuration for enhanced editing experience.
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version: 0.1

;; change leading characters for each window used by ace-window
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; enable some cool extensions like C-x C-j (dired-jump)
(require 'dired-x)

;; replace the standard Emacs's undo system with undo-tree
(global-undo-tree-mode)

;; use settings .editorconfig file when it is present
(require 'editorconfig)
(editorconfig-mode 1)

;; nice scrolling
(setq scroll-margin 0
	scroll-conservatively 1000
	scroll-preserve-screen-position 1)

;; use avy to navigate to visiable things
(require 'avy)

;; automatically insert pairs
(require 'smartparens-config)
(smartparens-global-mode 1)
(show-smartparens-global-mode 1)

;; enable robin mode
(robin-global-mode +1)

(provide 'robin-editor)
