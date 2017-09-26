;;; robin-editor.el --- Robin's editor configuration for enhanced editing experience.
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version: 0.1

;; do not backup files
(setq make-backup-files nil)

;; change leading characters for each window used by ace-window
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; enable some cool extensions like C-x C-j (dired-jump)
(require 'dired-x)

;; replace the standard Emacs's undo system with undo-tree
(require 'undo-tree)
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

;; change flymd temporary output directory
(setq flymd-output-directory robin-temp-dir)

;; NeoTree
(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; refresh NeoTree buffer automatically
(setq neo-autorefresh t)
;; find current file and jump to node
(setq neo-smart-open t)

;; enable Projectile
(projectile-global-mode t)
(setq projectile-cache-file (expand-file-name "projectile.cache" robin-save-dir))

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; counsel-gtags
(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)
(with-eval-after-load 'counsel-gtags
  (define-key counsel-gtags-mode-map (kbd "C-c f d") 'counsel-gtags-find-definition)
  (define-key counsel-gtags-mode-map (kbd "C-c f r") 'counsel-gtags-find-reference)
  (define-key counsel-gtags-mode-map (kbd "C-c f s") 'counsel-gtags-find-symbol)
  (define-key counsel-gtags-mode-map (kbd "C-c f b") 'counsel-gtags-go-backward)
  (define-key counsel-gtags-mode-map (kbd "C-c f f") 'counsel-gtags-find-file))

;; helm
(require 'helm-projectile)
(helm-projectile-on)

;; emamux
(require 'emamux)

(provide 'robin-editor)
