
;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

(cond ((< (string-to-int (car (split-string emacs-version "[.]" t))) 24)
       (add-to-list 'load-path (expand-file-name "~/.emacs.d"))
       (require 'package))
       (t
	(require 'package)
	(add-to-list 'load-path (expand-file-name "~/.emacs.d"))))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(clojure-mode
                      smex
                      idle-highlight-mode
                      clojure-test-mode
                      paredit
                      color-theme
                      color-theme-twilight
                      ido-ubiquitous
                      ;;yasnippet
                      ;;yasnippet-bundle
                      smex
                      org
                      anything
                      anything-config
                      slime
                      slime-repl
                      magit))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;(require 'yasnippet) ;; not yasnippet-bundle
;;(yas/initialize)


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

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

