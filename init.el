;;; init.el --- Robin's configuration entry point.
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version 0.1

;;; Commentary:

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar robin-user (getenv (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Robin is powering up... Be patient, Master %s!" robin-user)

(when (version< emacs-version "24.5.1")
  (error "Robin requires at least GNU Emacs 24.5.1, but you're runing %s" emacs-version))

(defvar robin-dir (file-name-directory load-file-name)
  "The root dir of the Emacs Robin distribution.")
(defvar robin-core-dir (expand-file-name "core" robin-dir)
  "The directory of Robin's core functionality.")
(defvar robin-save-dir (expand-file-name "auto-save-list" robin-dir)
  "This directory stores all the automatically generated save/history-files.")
(defvar robin-themes-dir (expand-file-name "themes" robin-dir)
  "This directory stores customize themes.")
(defvar robin-temp-dir "/tmp"
  "This directory is used to store temporary files.")


;; add Robin's directories to Emacs's `load-path'
(add-to-list 'load-path robin-core-dir)
(add-to-list 'custom-theme-load-path robin-themes-dir)

(message "Loading Robin's code...")

;; load Robin core stuff
(require 'robin-packages)
(require 'robin-custom)
(require 'robin-ui)
(require 'robin-core)
(require 'robin-mode)
(require 'robin-editor)
(require 'robin-global-keybindings)

;; save customize setting into custom.el
(setq custom-file (expand-file-name "custom.el" robin-dir))

(provide 'init)
;;; init.el ends here
