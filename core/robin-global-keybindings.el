;;; robin-global-keybings.el --- Robin's useful keybindings.
;;
;; Copyright (c) Japin Li <japinli@hotmail.com>
;;
;; version 0.1

;;; Commentary:

;;; Code:

;; keybinding for switch window
(global-set-key (kbd "M-p") 'ace-window)

;; repleace zap-to-char functionality with a powerful zop-to-char
(global-set-key (kbd "M-z") 'zop-up-to-char)
(global-set-key (kbd "M-Z") 'zop-to-char)

(global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)

;; toggle NeoTree
(global-set-key [f8] 'neotree-toggle)

;; ivy
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; emamux
(global-set-key (kbd "C-t") emamux:keymap)

;; imenu-list
(global-set-key (kbd "C-'") #'imenu-list-smart-toggle)

(provide 'robin-global-keybindings)
;;; robin-global-keybindings ends here
