;;; robin-mode.el --- Robin minor mode.
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version 0.1
;;; Commentary:

;;; Code:

(defvar robin-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c g") 'robin-google)
    (define-key map (kbd "C-c G") 'robin-github)
    (define-key map (kbd "C-c s") 'robin-stackoverflow)
    map)
  "Keymap for robin mode.")

(define-minor-mode robin-mode
  "Minor mode to consolidate Emacs Robin extensions.
\\{robin-mode-map}"
  :lighter " Pre"
  :keymap robin-mode-map)

(define-globalized-minor-mode robin-global-mode robin-mode robin-on)

(defun robin-on ()
  "Turn on `robin-mode'."
  (robin-mode +1))

(defun robin-off ()
  "Turn off `robin-mode'."
  (robin-mode -1))

(provide 'robin-mode)
;;; robin-mode.el ends here
