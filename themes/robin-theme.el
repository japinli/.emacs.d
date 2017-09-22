;;; robin-theme.el --- Robin's theme for Emacs.
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version: 0.1

(deftheme robin "Robin's emacs theme")

(custom-theme-set-faces
  'robin
  `(cursor ((t (:foreground "#222222" :background "#fce94f"))))
  )

;;;###autoload
(and load-file-name
  (boundp 'custom-theme-load-path)
  (add-to-list 'custom-theme-load-path
    (file-name-as-directory
      (file-name-directory load-file-name))))

(provide-theme 'robin)
