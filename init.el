;;; init.el --- Robin's configuration entry point.
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version 0.1

(defvar user (getenv (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Robin is powering up... Be patient, Master %s!" user)

(when (version< emacs-version "24.5.1")
  (error "Robin requires at least GNU Emacs 24.5.1, but you're runing %s" emacs-version))

(defvar robin-dir (file-name-directory load-file-name)
  "The root dir of the Emacs Robin distribution")
(defvar robin-core-dir (expand-file-name "core" robin-dir)
  "The directory of Robin's core functionality")

;; add Robin's directories to Emacs's `load-path'
(add-to-list 'load-path robin-core-dir)

(message "Loading Robin's code...")

;; load Robin core stuff
(require 'robin-packages)
(require 'robin-ui)
(require 'robin-editor)
(require 'robin-global-keybindings)
