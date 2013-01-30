;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl)
;; When you visit a file, point goes to the last place where it was
;; when you previously visited the same file.
(require 'saveplace)
;; FFAP mode replaces certain key bindings for finding files,
;; including C-x C-f, with commands that provide more sensitive
;; defaults.
(require 'ffap)
;; Making Buffer Names Unique
(require 'uniquify)
;; translates ANSI SGR (Select Graphic Rendition) escape sequences
;; like “Esc [ 30 m” into EmacsOverlays, TextProperties, or
;; XEmacsExtents with face colours, bold, etc.
(require 'ansi-color)
(require 'recentf)

;; a fix for package.el's dependency tracking, that seems to be
;; bugged (see http://melpa.milkbox.net/#known-issues)
(defadvice package-compute-transaction
  (before
   package-compute-transaction-reverse (package-list requirements)
   activate compile)
  "reverse the requirements"
  (setq requirements (reverse requirements))
  (print requirements))

(defun partition (list length)
  (loop
   while list
   collect (subseq list 0 length)
   do (setf list (nthcdr length list))))

(defun plist-to-alist (pl)
  (let ((parts (partition pl 2)))
    (mapcar #'(lambda (x) (cons (car x) (cadr x))) parts)))

(cond ((< (string-to-int (car (split-string emacs-version "[.]" t))) 24)
       (add-to-list 'load-path (expand-file-name "~/.emacs.d"))
       (require 'package))
      (t
       (require 'package)
       (add-to-list 'load-path (expand-file-name "~/.emacs.d"))))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/modules"))

(dolist (p (list '("melpa" . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives p nil))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(clojure-mode
		      nrepl
                      smex
                      idle-highlight-mode
                      ;;clojure-test-mode
                      paredit
                      color-theme
                      ;;color-theme-twilight
                      ido-ubiquitous
                      yasnippet
                      ;;yasnippet-bundle
                      bookmark+
                      deft
                      ;;dired+
                      smex
                      org
                      helm
                      auto-complete
                      ac-nrepl
                      ack-and-a-half
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
             es-colors
             es-deft
             es-aliases
             es-bindings
             ))
  (require m))

;;(add-to-list 'load-path (concat dot-emacs-dir "/yasnippet-0.6.1c"))

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
    (load custom-file))
