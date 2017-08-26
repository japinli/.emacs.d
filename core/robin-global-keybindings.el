;;; robin-global-keybings.el --- Robin's useful keybindings.
;;
;; Copyright (c) Japin Li <japinli@hotmail.com>
;;
;; version 0.1

;; keybinding for switch window
(global-set-key (kbd "M-p") 'ace-window)

;; repleace zap-to-char functionality with a powerful zop-to-char
(global-set-key (kbd "M-z") 'zop-up-to-char)
(global-set-key (kbd "M-Z") 'zop-to-char)

(global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)

(provide 'robin-global-keybindings)
