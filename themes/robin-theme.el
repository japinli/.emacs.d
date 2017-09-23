;;; robin-theme.el --- Robin's theme for Emacs.
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version: 0.1

(deftheme robin "Robin's emacs theme")

(defvar robin-default-colors-alist
  '(
     ("robin-fg"        . "#FF0000")
     ("robin-fg+1"      . "#FFFFEF")
     ("robin-fg-1"      . "#656555")
     ("robin-bg"        . "#3F3F3F")
     ("robin-bg+1"      . "#4F4F4F")
     ("robin-bg+2"      . "#5F5F5F")
     ("robin-bg-1"      . "#656555")
     ("robin-green"     . "#7F9F7F")
     ("robin-green+1"   . "#8FB28F")
     ("robin-green-1"   . "#5F7F5F")
     ("robin-blue+5"    . "#565761")
     )
  "List of Robin theme colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-n' suffixes indicate a color is darker.")

(defvar robin-override-colors-alist
  '()
  "Place to override default theme colors.")

(defvar robin-colors-alist
  (append robin-default-colors-alist robin-override-colors-alist))

(defmacro robin-with-color-variables (&rest body)
  "`let' bind all colors defined in `robin-colors-alist' around BODY.
Also bind `class to ((class color) (min-colors 89)).'"
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
          ,@(mapcar (lambda (cons)
                      (list (intern (car cons)) (cdr cons)))
              robin-colors-alist))
     ,@body))

(robin-with-color-variables
  (custom-theme-set-faces
    'robin
    ;;;; Built-in
    ;;;; basic coloring
    `(button ((t (:underline t))))
    `(default ((t (:foreground ,robin-fg :background ,robin-bg))))
    `(cursor ((t (:foreground ,robin-fg :background ,robin-fg+1))))
    `(mode-line
       ((,class (:foreground ,robin-green+1
                  :background ,robin-bg-1
                  :box (:line-width -1 :style released-button)))
         (t :inverse-video t)))
    `(linum ((t (:slant italic :foreground ,robin-fg+1 :background ,robin-blue+5))))
    ))

;;;###autoload
(and load-file-name
  (boundp 'custom-theme-load-path)
  (add-to-list 'custom-theme-load-path
    (file-name-as-directory
      (file-name-directory load-file-name))))

(provide-theme 'robin)
