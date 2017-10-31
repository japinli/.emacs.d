;;; robin-core.el --- Robin core functions
;;
;; Copyright (c) 2017 Japin Li <japinli@hotmail.com>
;;
;; version 0.1

;;; Commentary:

;;; Code:

;; Google chrome prevents jQuery from loading local files.
;; If still using google chrome, we should kill all google chrome process
;; before using 'flymd-flyit', So we use Firefox.
;; see https://github.com/mola-T/flymd/blob/master/browser.md
(defun robin-flymd-browser-function (url)
  "Set flymd URL."
  (let ((browse-url-browser-function 'browse-url-firefox))
    (browse-url url)))
(setq flymd-browser-open-function 'robin-flymd-browser-function)

(defun robin-search (query-url prompt)
  "Open the QUERY-URL, PROMPT set the `read-string' prompt."
  (browse-url
    (concat query-url
      (url-hexify-string
        (if mark-active
          (buffer-string (region-beginning) (region-end))
          (read-string prompt))))))

(defmacro robin-install-engine (engine-name engine-url engine-prompt)
  "Install the ENGINE-NAME use ENGINE-URL to search as ENGINE-PROMPT."
  `(defun ,(intern (format "robin-%s" engine-name)) ()
     ,(format "Search %s with a query or region if any." engine-name)
     (interactive)
     (robin-search ,engine-url, engine-prompt)))

(robin-install-engine "google" "https://www.google.com.hk/search?q=" "Google: ")
(robin-install-engine "github" "https://github.com/search?q=" "GitHub: ")
(robin-install-engine "stackoverflow" "https://stackoverflow.com/search?q=" "Stackoverflow: ")

(provide 'robin-core)
;;; robin-core.el ends here
