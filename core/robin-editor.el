;;; robin-editor.el --- Robin's editor configuration for enhanced editing experience.
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version: 0.1
;;
;;; Commentary:

;;; Code:

;; do not backup files
(setq make-backup-files nil)

;; change leading characters for each window used by ace-window
(require 'ace-window)
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
;;(robin-global-mode t)

;; change flymd temporary output directory
(require 'flymd)
(setq flymd-output-directory robin-temp-dir)

;; NeoTree
(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; refresh NeoTree buffer automatically
(setq neo-autorefresh t)
;; find current file and jump to node
(setq neo-smart-open t)

;; enable Projectile
(require 'projectile)
(projectile-mode t)
(setq projectile-cache-file (expand-file-name "projectile.cache" robin-save-dir))

;; swiper
(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; counsel-gtags
(require 'counsel-gtags)
(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)
(with-eval-after-load 'counsel-gtags
  (define-key counsel-gtags-mode-map (kbd "C-c g d") 'counsel-gtags-find-definition)
  (define-key counsel-gtags-mode-map (kbd "C-c g r") 'counsel-gtags-find-reference)
  (define-key counsel-gtags-mode-map (kbd "C-c g s") 'counsel-gtags-find-symbol)
  (define-key counsel-gtags-mode-map (kbd "C-c g b") 'counsel-gtags-go-backward)
  (define-key counsel-gtags-mode-map (kbd "C-c g f") 'counsel-gtags-go-forward)
  (define-key counsel-gtags-mode-map (kbd "C-c g F") 'counsel-gtags-find-file)
  (define-key counsel-gtags-mode-map (kbd "C-c g c") 'counsel-gtags-dwim)
  (define-key counsel-gtags-mode-map (kbd "C-c g u") 'counsel-gtags-update-tags))

;; helm
(require 'helm-projectile)
(helm-projectile-on)

;; emamux
(require 'emamux)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; ycmd
(require 'ycmd)
(defvar robin-ycmd-dir (file-truename "~/.local/ycmd/"))
(add-hook 'after-init-hook #'global-ycmd-mode)
(set-variable 'ycmd-server-command `("python" ,(file-truename "~/.local/ycmd/ycmd")))
(set-variable 'ycmd-global-config (expand-file-name "examples/.ycm_extra_conf.py" robin-ycmd-dir))
(set-variable 'ycmd-extra-conf-handler 'load)

(global-company-mode t)
(require 'company-ycmd)
(company-ycmd-setup)
(require 'flycheck-ycmd)
(global-flycheck-mode t)
(flycheck-ycmd-setup)

;; imenu-list
(require 'imenu-list)
(setq imenu-list-auto-resize t)
(setq imenu-list-position 'left)

(provide 'robin-editor)
;;; robin-editor.el ends here
