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

(provide 'robin-editor)
