(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(dolist (m '(starter-kit
             es-globals
             es-erlang
             es-clojure
             es-python
             es-skel
             es-org
             es-colors))
  (require m))

;;(add-to-list 'load-path (concat dot-emacs-dir "/yasnippet-0.6.1c"))
(ignore-errors (require 'yasnippet) ;; not yasnippet-bundle
	       (yas/initialize))

(color-theme-enri)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-default-style (quote ((c++-mode . "stroustrup") (java-mode . "java") (awk-mode . "awk") (other . "gnu"))))
 '(column-number-mode t)
 '(display-time-mode t)
 '(org-agenda-files (quote ("~/machome/Dropbox/org/progetti.org")))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-column ((t (:strike-through nil :underline nil :slant normal :weight normal :height 120 :family "DejaVu Sans Mono"))))
 '(org-link ((((class color) (background dark)) (:foreground "Cyan" :underline t))))
 '(org-property-value ((t (:foreground "LightGreen"))) t)
 '(org-scheduled-today ((((class color) (min-colors 88) (background dark)) (:foreground "chocolate1" :weight bold))))
 '(outline-2 ((t (:inherit font-lock-keyword-face))))
 '(outline-3 ((t (:inherit font-lock-string-face))))
 '(outline-4 ((t (:inherit font-lock-type-face))))
 '(outline-5 ((t (:inherit font-lock-comment-face))))
 '(outline-6 ((t (:inherit font-lock-builtin-face))))
 '(outline-7 ((t (:inherit font-lock-variable-name-face))))
 '(outline-8 ((t (:inherit font-lock-constant-face))))
 '(variable-pitch ((t (:family "sans")))))


