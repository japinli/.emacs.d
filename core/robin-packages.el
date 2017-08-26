;;; robin-packages --- Robin's package manager.
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version 0.1

(require 'cl)
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; set package directory to be relative to Robin install path
(setq package-user-dir (expand-file-name "elpa" robin-dir))
(package-initialize)
      
(defvar robin-packages
  '(ace-window
    flymd
    markdown-mode
    nlinum
    undo-tree
    which-key
    zop-to-char)
  "A list of packages to ensure are installed at launch.")

(defun robin-packages-installed-p ()
  "Check if all packages in `robin-packages' are installed."
  (every #'package-installed-p robin-packages))

(defun robin-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package robin-packages)
    (add-to-list 'robin-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun robin-require-packages (packages)
  "Ensure PACKAGES are installed. Missing packages are installed automatically."
  (mapc #'robin-require-package packages))

(defun robin-install-packages ()
  "Install all packages listed in `robin-packages'"
  (unless (robin-packages-installed-p)
    ;; check for new packages
    (message "Emacs Robin is new refreshing its package database...")
    (package-refresh-contents)
    (message "done.")
    ;; install the missing packages
    (robin-require-packages robin-packages)))

;; package installation
(robin-install-packages)

(when (package-installed-p 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode)))

(provide 'robin-packages)
