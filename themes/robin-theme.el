;;; robin-theme.el --- Robin's theme for Emacs.
;;
;; version: 0.1

;;; Commentary:

;;; Code:

(unless (>= emacs-major-version 24)
  (error "The robin theme requires Emacs 24 or later!"))

(deftheme robin "The Robin colour theme")

(defgroup robin nil
  "Robin theme options."
  :group 'faces)

(defcustom robin-distinct-fringe-background nil
  "Make the fringe background different from the normal background color.
Also affects 'linum-mode' background."
  :type 'boolean
  :group 'robin)

(defcustom robin-use-variable-pitch nil
  "Use variable pitch face for some headings and titles."
  :type 'boolean
  :group 'robin)

(defcustom robin-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'robin)

(defcustom robin-height-plus-1 1.1
  "Font size +1."
  :type 'number
  :group 'robin)

(defcustom robin-height-plus-2 1.15
  "Font size +2."
  :type 'number
  :group 'robin)

(defcustom robin-height-plus-3 1.2
  "Font size +3."
  :type 'number
  :group 'robin)

(defcustom robin-height-plus-4 1.3
  "Font size +4."
  :type 'number
  :group 'robin)

;; Primary colors
(defcustom robin-yellow "#E6DB74"
  "Primary colors - yellow."
  :type 'string
  :group 'robin)

(defcustom robin-orange "#FD971F"
  "Primary colors - orange."
  :type 'string
  :group 'robin)

(defcustom robin-red "#F92672"
  "Primary colors - red."
  :type 'string
  :group 'robin)

(defcustom robin-magenta "#FD5FF0"
  "Primary colors - magenta."
  :type 'string
  :group 'robin)

(defcustom robin-blue "#66D9EF"
  "Primary colors - blue."
  :type 'string
  :group 'robin)

(defcustom robin-green "#A6E22E"
  "Primary colors - green."
  :type 'string
  :group 'robin)

(defcustom robin-cyan "#A1EFE4"
  "Primary colors - cyan."
  :type 'string
  :group 'robin)

(defcustom robin-violet "#AE81FF"
  "Primary colors - violet."
  :type 'string
  :group 'robin)

(defcustom robin-gray "#64645E"
  "Primary colors - gray."
  :type 'string
  :group 'robin)

(defcustom robin-foreground "#F8F8F2"
  "Adaptive colors - foreground."
  :type 'string
  :group 'robin)

(defcustom robin-background "#272822"
  "Adaptive colors - background."
  :type 'string
  :group 'robin)

(defcustom robin-comments "#75715E"
  "Adaptive colors - comments."
  :type 'string
  :group 'robin)

(defcustom robin-emphasis "#F8F8F0"
  "Adaptive colors - emphasis."
  :type 'string
  :group 'robin)

(defcustom robin-line-number "#8F908A"
  "Adaptive colors - line number."
  :type 'string
  :group 'robin)

(defcustom robin-highlight "#49483E"
  "Adaptive colors - highlight."
  :type 'string
  :group 'robin)

(defcustom robin-highlight-alt "#3E3D31"
  "Adaptive colors - highlight."
  :type 'string
  :group 'robin)

(defcustom robin-highlight-line "#3C3D37"
  "Adaptive colors - line highlight."
  :type 'string
  :group 'robin)

(let* (;; Variable pitch
        (robin-pitch (if robin-use-variable-pitch
                       'variable-pitch
                       'default))

        ;; Definitions for guis that support 256 colors
        (robin-class '((class color) (min-colors 257)))

        ;; Darker and lighter accented colors
        (robin-yellow-d       "#BEB244")
        (robin-yellow-l       "#FFF7A8")
        (robin-orange-d       "#D47402")
        (robin-orange-l       "#FFAC4A")
        (robin-red-d          "#F70057")
        (robin-red-l          "#FA518D")
        (robin-magenta-d      "#FB35EA")
        (robin-magenta-l      "#FE8CF4")
        (robin-violet-d       "#945AFF")
        (robin-violet-l       "#C9ACFF")
        (robin-blue-d         "#40CAE4")
        (robin-blue-l         "#92E7F7")
        (robin-cyan-d         "#74DBCD")
        (robin-cyan-l         "#D3FBF6")
        (robin-green-d        "#86C30D")
        (robin-green-l        "#BBEF53")
        (robin-gray-d         "#35331D")
        (robin-gray-l         "#7B7962")
        ;; Adaptive higher/lower contrast accented colors
        (robin-foreground-hc  "#141414")
        (robin-foreground-lc  "#171A0B")
        ;; High contrast colors
        (robin-yellow-hc      "#FFFACE")
        (robin-yellow-lc      "#9A8F21")
        (robin-orange-hc      "#FFBE74")
        (robin-orange-lc      "#A75B00")
        (robin-red-hc         "#FEB0CC")
        (robin-red-lc         "#F20055")
        (robin-magenta-hc     "#FEC6F9")
        (robin-magenta-lc     "#F309DF")
        (robin-violet-hc      "#F0E7FF")
        (robin-violet-lc      "#7830FC")
        (robin-blue-hc        "#CAF5FD")
        (robin-blue-lc        "#1DB4D0")
        (robin-cyan-hc        "#D3FBF6")
        (robin-cyan-lc        "#4BBEAE")
        (robin-green-hc       "#CCF47C")
        (robin-green-lc       "#679A01")

        ;; Distinct fringe
        (robin-fringe-bg (if robin-distinct-fringe-background
                           robin-gray
                           robin-background))

        ;; Definitions for terminals that do not support 256 colors
        (robin-256-class '((class color) (min-colors 89)))
        ;; Primary colors
        (robin-256-yellow         "#CDC673")
        (robin-256-orange         "#FF8C00")
        (robin-256-red            "#FF1493")
        (robin-256-magenta        "#D700D7")
        (robin-256-violet         "#AF87FF")
        (robin-256-blue           "#5FD7FF")
        (robin-256-cyan           "#5FFFFF")
        (robin-256-green          "#87D700")
        (robin-256-gray           "#3D3D3D")
        ;; Darker and lighter accented colors
        (robin-256-yellow-d       "#878700")
        (robin-256-yellow-l       "#FFFF87")
        (robin-256-orange-d       "#AF5F00")
        (robin-256-orange-l       "#FFAF5F")
        (robin-256-red-d          "#870000")
        (robin-256-red-l          "#FF5F87")
        (robin-256-magenta-d      "#AF0087")
        (robin-256-magenta-l      "#FF87DF")
        (robin-256-violet-d       "#5F00AF")
        (robin-256-violet-l       "#AF87D7")
        (robin-256-blue-d         "#008787")
        (robin-256-blue-l         "#87D7FF")
        (robin-256-cyan-d         "#5FAFAF")
        (robin-256-cyan-l         "#AFFFFF")
        (robin-256-green-d        "#5F8700")
        (robin-256-green-l        "#AFD700")
        (robin-256-gray-d         "#333333")
        (robin-256-gray-l         "#707070")
        ;; Adaptive colors
        (robin-256-foreground     "#F5F5F5")
        (robin-256-background     "#1B1E1C")
        (robin-256-comments       "#8B8878")
        (robin-256-emphasis       "#FFFAFA")
        (robin-256-line-number    "#8F908A")
        (robin-256-highlight      "#474747")
        (robin-256-highlight-alt  "#3E3E3E")
        (robin-256-highlight-line "#000000")
        ;; Adaptive higher/lower contrast accented colors
        (robin-256-foreground-hc  "#171A0B")
        (robin-256-foreground-lc  "#141414")
        ;; High contrast colors
        (robin-256-yellow-hc      robin-256-yellow-d)
        (robin-256-yellow-lc      robin-256-yellow-l)
        (robin-256-orange-hc      robin-256-orange-d)
        (robin-256-orange-lc      robin-256-orange-l)
        (robin-256-red-hc         robin-256-red-d)
        (robin-256-red-lc         robin-256-red-l)
        (robin-256-magenta-hc     robin-256-magenta-d)
        (robin-256-magenta-lc     robin-256-magenta-l)
        (robin-256-violet-hc      robin-256-violet-d)
        (robin-256-violet-lc      robin-256-violet-l)
        (robin-256-blue-hc        robin-256-blue-d)
        (robin-256-blue-lc        robin-256-blue-l)
        (robin-256-cyan-hc        robin-256-cyan-d)
        (robin-256-cyan-lc        robin-256-cyan-l)
        (robin-256-green-hc       robin-256-green-d)
        (robin-256-green-lc       robin-256-green-l)

        ;; Distinct fringe
        (robin-256-fringe-bg (if robin-distinct-fringe-background
                               robin-256-gray
                               robin-256-background)))
  (custom-theme-set-faces
    'robin

    ;; font lock for syntax highlighting
    `(font-lock-builtin-face
       ((,robin-class (:foreground ,robin-red :weight normal))
         (,robin-256-class (:foreground ,robin-256-red :weight normal))))

    `(font-lock-comment-delimiter-face
       ((,robin-class (:foreground ,robin-comments))
         (,robin-256-class (:foreground ,robin-256-comments))))

    `(font-lock-comment-face
       ((,robin-class (:foreground ,robin-comments))
         (,robin-256-class (:foreground ,robin-256-comments))))

    `(font-lock-constant-face
       ((,robin-class (:foreground ,robin-violet))
         (,robin-256-class (:foreground ,robin-256-violet))))

    `(font-lock-doc-face
       ((,robin-class (:foreground ,robin-yellow))
         (,robin-256-class (:foreground ,robin-256-yellow))))

    `(font-lock-function-name-face
       ((,robin-class (:foreground ,robin-green))
         (,robin-256-class (:foreground ,robin-256-green))))

    `(font-lock-keyword-face
       ((,robin-class (:foreground ,robin-red :weight normal))
         (,robin-256-class (:foreground ,robin-256-red :weight normal))))

    `(font-lock-negation-char-face
       ((,robin-class (:foreground ,robin-yellow :weight bold))
         (,robin-class (:foreground ,robin-256-yellow :weight bold))))

    `(font-lock-preprocessor-face
       ((,robin-class (:foreground ,robin-red))
         (,robin-256-class (:foreground ,robin-256-red))))

    `(font-lock-string-face
       ((,robin-class (:foreground ,robin-yellow))
         (,robin-256-class (:foreground ,robin-256-yellow))))

    `(font-lock-type-face
       ((,robin-class (:foreground ,robin-blue :italic t))
         (,robin-256-class (:foreground ,robin-blue :italic t))))

    `(font-lock-variable-name-face
       ((,robin-class (:foreground ,robin-orange))
         (,robin-256-class (:foreground ,robin-256-orange))))

    `(font-lock-warning-face
       ((,robin-class (:foreground ,robin-orange
                        :weight bold :italic t :underline t))
         (,robin-256-class (:foreground ,robin-256-orange
                             :weight bold :italic t :underline t))))

    ;; general colouring
    `(button ((t (:underline t))))

    `(default
       ((,robin-class (:foreground ,robin-foreground
                        :background ,robin-background))
         (,robin-256-class (:foreground ,robin-256-foreground
                             :background ,robin-256-background))))

    `(highlight
       ((,robin-class (:background ,robin-highlight))
         (,robin-256-class (:background ,robin-256-highlight))))

    `(lazy-highlight
       ((,robin-class (:inherit highlight
                        :background ,robin-highlight-alt))
         (,robin-256-class (:inherit highlight
                             :background ,robin-256-highlight-alt))))
    `(region
       ((,robin-class (:inherit highlight
                        :background ,robin-highlight))
         (,robin-256-class (:inherit highlight
                             :background ,robin-256-highlight))))

    `(secondary-selection
       ((,robin-class (:inherit region
                        :background ,robin-highlight-alt))
         (,robin-256-class (:inherit region
                             :background ,robin-256-highlight-alt))))

    `(shadow
       ((,robin-class (:foreground ,robin-comments))
         (,robin-256-class (:foreground ,robin-256-comments))))

    `(match
       ((,robin-class (:background ,robin-green
                        :foreground ,robin-background
                        :weight bold))
         (,robin-256-class (:background ,robin-256-green
                             :foreground ,robin-256-background
                             :weight bold))))

    `(cursor
       ((,robin-class (:foreground ,robin-background
                        :background ,robin-foreground
                        :inverse-video t))
         (,robin-256-class (:foreground ,robin-256-background
                             :background ,robin-256-foreground
                             :inverse-video t))))
    `(mouse
       ((,robin-class (:foreground ,robin-background
                        :background ,robin-foreground
                        :inverse-video t))
         (,robin-256-class (:foreground ,robin-256-background
                             :background ,robin-256-foreground
                             :inverse-video t))))
    `(menu
       ((,robin-class (:foreground ,robin-foreground
                        :background ,robin-background))
         (,robin-256-class (:foreground ,robin-256-foreground
                             :background ,robin-256-background))))
    ;; mode-line
    `(mode-line-buffer-id
       ((,robin-class (:foreground ,robin-green :weight bold))
         (,robin-256-class (:foreground ,robin-256-green :weight bold))))
    `(mode-line
       ((,robin-class (:inverse-video unspecified
                        :underline unspecified
                        :foreground ,robin-emphasis
                        :background ,robin-highlight
                        :box (:line-width 1
                               :color ,robin-gray
                               :style unspecified)))
         (,robin-256-class (:inverse-video unspecified
                             :underline unspecified
                             :foreground ,robin-256-foreground
                             :background ,robin-256-highlight-line
                             :box (:line-width 1
                                    :color ,robin-256-highlight
                                    :style unspecified)))))
    `(mode-line-inactive
       ((,robin-class (:inverse-video unspecified
                        :underline unspecified
                        :foreground ,robin-comments
                        :background ,robin-background
                        :box (:line-width 1
                               :color ,robin-gray
                               :style unspecified)))
         (,robin-256-class (:inverse-video unspecified
                             :underline unspecified
                             :foreground ,robin-256-comments
                             :background ,robin-256-background
                             :box (:line-width 1
                                    :color ,robin-256-gray
                                    :style unspecified)))))

    ;; header-line
    `(header-line
       ((,robin-class (:foreground ,robin-emphasis
                        :background ,robin-highlight
                        :box (:line-width 1
                               :color ,robin-gray
                               :style unspecified)))
         (,robin-256-class (:foreground ,robin-256-highlight
                             :background ,robin-256-gray
                             :box (:line-width 1
                                    :color ,robin-256-gray
                                    :style unspecified)))))

    ;; dired
    `(dired-directory
       ((,robin-class (:foreground ,robin-blue))
         (,robin-256-class (:foreground ,robin-256-blue))))
    `(dired-flagged
       ((,robin-class (:foreground ,robin-red))
         (,robin-256-class (:foreground ,robin-256-red))))
    `(dired-header
       ((,robin-class (:foreground ,robin-blue
                        :background ,robin-background
                        :inherit bold))
         (,robin-256-class (:foreground ,robin-256-blue
                              :background ,robin-256-background
                             :inherit bold))))
    `(dired-ignored
       ((,robin-class (:inherit shadow))
         (,robin-256-class (:inherit shadow))))
    `(dired-mark
       ((,robin-class (:foreground ,robin-green :weight bold))
         (,robin-256-class (:foreground ,robin-256-green :weight bold))))
    `(dired-marked
       ((,robin-class (:foreground ,robin-violet :inherit bold))
         (,robin-256-class (:foreground ,robin-256-violet :inherit bold))))
    `(dired-perm-write
       ((,robin-class (:foreground ,robin-foreground :underline t))
         (,robin-256-class (:foreground ,robin-256-foreground :underline t))))
    `(dired-symlink
       ((,robin-class (:foreground ,robin-cyan :slant italic))
         (,robin-256-class (:foreground ,robin-256-cyan :slant italic))))
    `(dired-warning
       ((,robin-class (:foreground ,robin-orange :underline t))
         (,robin-256-class (:foreground ,robin-256-orange :underline t))))

    ;; dorpdown
    `(dropdown-list-face
       ((,robin-class (:background ,robin-highlight-line
                        :foreground ,robin-blue))
         (,robin-256-class (:background ,robin-256-highlight-line
                             :foreground ,robin-256-blue))))
    `(dropdown-list-selection-face
       ((,robin-class (:background ,robin-blue
                        :foreground ,robin-background))
         (,robin-256-class (:background ,robin-256-blue
                             :foreground ,robin-256-background))))

    ;; isearch
    `(isearch
       ((,robin-class (:inherit region :foreground ,robin-background
                        :background ,robin-yellow))
         (,robin-256-class (:inherit region :foreground ,robin-256-background
                             :background ,robin-256-yellow))))
    `(isearch-fail
       ((,robin-class (:inherit isearch :foreground ,robin-red
                        :background ,robin-background :bold t))
         (,robin-256-class (:inherit isearch :foreground ,robin-256-red
                             :background ,robin-256-background :bold t))))

    ))

;;; ###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'robin)
;;; robin-theme.el ends here
