;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(cond
 ((eq system-type 'darwin)
  (unless (null window-system)
    (dolist (v '((height . 45)
                 (width . 90)))
      (add-to-list 'initial-frame-alist v))
    ;(set-default-font
    ;"-apple-Menlo-medium-normal-normal-*-18-*-*-*-m-0-iso10646-1")
    )
  (setq helm-locate-command (concat "mdfind -onlyin " 
				    (expand-file-name "~") 
				    " -name %s %s")
        locate-command "mdfind")))
(setq insert-directory-program "/usr/local/bin/gls")
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

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

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

;(dolist (p (list '("melpa" . "http://melpa.milkbox.net/packages/")))
;  (add-to-list 'package-archives p nil))

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
    (load custom-file))

(ignore-errors   
  (when (not package-archive-contents)
    (package-refresh-contents)))

(defvar my-packages '(clojure-mode
                      cider
		      idle-highlight-mode
                      ;smex
                      key-chord
		      magit
		      helm
                      helm-projectile
		      bookmark+
                      auto-complete
                      undo-tree
		      cider
		      ac-cider
                      smartparens
                      projectile
                      ;color-theme-twilight
                      ido-ubiquitous
                      yasnippet
                      ;;yasnippet-bundle
                      dired+
                      org
                      ack-and-a-half
                      deft
                      epc
                      jedi
                      virtualenv
                      flycheck))
;;(ignore-errors)
(let ((package-refreshed nil))
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (unless package-refreshed
        (package-refresh-contents)
        (setf package-refreshed t))
      (package-install p))))

;;(yas/initialize)

(dolist (m '(starter-kit
             es-globals
             es-skel
             es-colors
             es-deft
             es-aliases
             es-bindings
             es-python
             es-org
             clojure-mode-autoloads
             es-clojure))
  (require m))

;;
