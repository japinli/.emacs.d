;;; robin-theme.el --- Robin's theme for Emacs.
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version: 0.1

(deftheme robin "Robin's emacs theme")

(defvar robin-default-colors-alist
  '(
     ("robin-fg"        . "#F8F8F2")
     ("robin-fg+1"      . "#FFFFEF")
     ("robin-fg-1"      . "#656555")
     ("robin-bg"        . "#3F3F3F")
     ("robin-bg+1"      . "#4F4F4F")
     ("robin-bg+2"      . "#5F5F5F")
     ("robin-bg-1"      . "#656555")
     ("robin-black"     . "#000000")

     ("robin-rea-1"     . "#C40000")
     ("robin-red"       . "#FF0000")
     ("robin-red+1"     . "#FF4E4E")
     ("robin-red+2"     . "#FF9D9D")

     ("robin-green-3"   . "#4BD34B")
     ("robin-green-2"   . "#4F5B4F")
     ("robin-green-1"   . "#5F7F5F")
     ("robin-green"     . "#7F9F7F")
     ("robin-green+1"   . "#8FB28F")
     ("robin-green+2"   . "#9FC59F")
     ("robin-green+3"   . "#AFD8AF")
     ("robin-green+4"   . "#BFEBBF")

     ("robin-blue+1"    . "#94BFF3")
     ("robin-blue"      . "#8CD0D3")
     ("robin-blue-1"    . "#7CB8BB")
     ("robin-blue-2"    . "#6CA0A3")
     ("robin-blue-3"    . "#5C888B")
     ("robin-blue-4"    . "#4C7073")
     ("robin-blue-5"    . "#366060")

     ("robin-yellow-5"  . "#F8F8F2")

     ("robin-gray+1"    . "#8D8D8D")
     ("robin-gray"      . "#808080")
     ("robin-gray-1"    . "#737373")
     ("robin-gray-2"    . "#676767")
     ("robin-gray-3"    . "#5A5A5A")
     ("robin-gray-4"    . "#4B4B4B")
     ("robin-gray-5"    . "#3F3F3F")

     ("robin-cyan+3"    . "#647C7C")
     ("robin-cyan+5"    . "#3F4F4F")
     ("robin-origin-5"  . "#FFB86C")

     ("robin-pink-1"    . "#FF0394")
     ("robin-pink"      . "#FF3EAD")
     ("robin-pink+1"    . "#FF79C6")
     ("robin-pink+2"    . "#FFB4DF")
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
    `(default ((t (:foreground ,robin-fg :background ,robin-gray-5))))
    `(cursor ((t (:foreground ,robin-fg :background ,robin-fg+1))))
    `(mode-line
       ((,class (:foreground ,robin-green+1
                  :background ,robin-bg-1
                  :box (:line-width -1 :style released-button)))
         (t :inverse-video t)))
    `(linum ((t (:slant italic :foreground ,robin-cyan+3 :background ,robin-gray-5))))
    `(vertical-border ((t (:foreground ,robin-green+1 :background ,robin-bg+2))))
    ;;;; syntax
    `(font-lock-builtin-face ((t (:foreground ,robin-gray :weight bold))))
    `(font-lock-comment-face ((t (:foreground ,robin-gray))))
    `(font-lock-comment-delimiter-face ((t (:foreground ,robin-gray-1))))
    `(font-lock-constant-face ((t (:foreground ,robin-green+4))))
    `(font-lock-doc-face ((t (:foreground ,robin-green+2))))
    `(font-lock-function-name-face ((t (:foreground ,robin-blue+1))))
    `(font-lock-keyword-face ((t (:foreground ,robin-pink-1 :weight bold))))
    `(font-lock-negation-char-face ((t (:foreground ,robin-yellow-5 :weight bold))))
    `(font-lock-preprocessor-face ((t (:foreground ,robin-pink+1))))
    `(font-lock-string-face ((t (:foreground ,robin-green-3))))
    `(font-lock-type-face ((t (:foreground ,robin-pink))))
    `(font-lock-variable-name-fact ((t (:foreground ,robin-origin-5))))
    `(font-lock-warning-face ((t (:foreground ,robin-red+2 :weight bold))))
    ))

;;;###autoload
(and load-file-name
  (boundp 'custom-theme-load-path)
  (add-to-list 'custom-theme-load-path
    (file-name-as-directory
      (file-name-directory load-file-name))))

(provide-theme 'robin)
