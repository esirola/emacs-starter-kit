(require 'cl)
(require 'autoinsert)
(require 'uniquify)
(require 'helm)
(require 'helm-misc)
(require 'helm-config)

;;;------------------------------------------------------------
;;; global variables
;;;------------------------------------------------------------

(defconst organization "StatPro Italia s.r.l.")
(defconst user-mail-address "enrico.sirola@statpro.com")
(defconst frame-title-format
  (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
(defconst european-calendar-style 't)


;; ----------------------------------------------------------------------
;; carica le features estese di dired
;; ----------------------------------------------------------------------
;; (add-hook 'dired-load-hook
;;           (lambda ()
;;             (load "dired-x")
;;             ;; Set dired-x global variables here.  For example:
;;             ;; (setq dired-guess-shell-gnutar "gtar")
;;             ;; (setq dired-x-hands-off-my-keys nil)
;;             (setq dired-omit-extensions
;;                   '(".o" ".lo" ".pyc" ".pyo" ".elc" "~"))
;;             (dired-omit-mode t)
;;             ))

;; (autoload (quote dired-jump) "dired" "\
;;      Jump to Dired buffer corresponding to current buffer.
;;      If in a file, Dired the current directory and move to file's line.
;;      If in Dired already, pop up a level and goto old directory's line.
;;      In case the proper Dired file line cannot be found, refresh the Dired
;;      buffer and try again." t nil)
;; (autoload (quote dired-jump-other-window) "dired" "\
;;      Like \\[dired-jump] (dired-jump) but in other window." t nil)

(global-font-lock-mode t)
(transient-mark-mode t)
(show-paren-mode t)
(setq calendar-week-start-day 1)
(setq visible-bell t)
(setq-default save-place t)
(setq enable-recursive-minibuffers t)

(dolist (c '(windows-1252 utf-8))
  (prefer-coding-system c))

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'find-file-hooks 'auto-insert)
;(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'shell-hook 'ansi-color-for-comint-mode-on)

(line-number-mode 1)
(column-number-mode 1)
(display-time)
(menu-bar-mode t)
;;(cua-mode t)
;;(ffap-bindings)
;;(ido-mode t)
(recentf-mode 1)

(when window-system
  (tool-bar-mode -1)
  (global-hl-line-mode t)
  (scroll-bar-mode t))

;; il seguito e' reso obsoleto dall'uso di tmux con le seguenti
;; opzioni nel file di conf:
;; set -g default-terminal "xterm-256color"
;; set -g xterm-keys on
;; tenuto per riferimento
(defun terminal-bindings ()
  "bindongs to be used when running in a terminal"
  (interactive)
  ;; this is what readline does (see inputrc)
  ;; unfortunately, it's a problem when some modes redefine
  ;; C-<left|right|up|down> because it's not reflected here
  (global-set-key (kbd "M-[ c") 'forward-word) ; C-<right>
  (global-set-key (kbd "M-[ d") 'backward-word) ; C-<left>
  (global-set-key (kbd "M-[ a") 'backward-paragraph) ; C-<up>
  (global-set-key (kbd "M-[ b") 'forward-paragraph) ; C-<down>
  )

(setq-default show-trailing-whitespace t
              indicate-empty-lines t)
(put 'scroll-left 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq bookmark-default-file "~/.emacs-bookmarks"
      delete-moving-to-trash t
      bookmark-save-flag 1)

(setq auto-save-interval 400 ;; 4 rows
      auto-save-timeout 600 ;; 10 mins
      )

(setq-default indent-tabs-mode nil)
(setq home (concat (getenv "HOME") "/"))
(setq dot-emacs-dir (concat home ".emacs.d/"))
(setq c-default-style
      '((c++-mode . "stroustrup")
        (java-mode . "java")
        (awk-mode . "awk")
        (other . "gnu"))
      uniquify-buffer-name-style 'forward)

(setq hippie-expand-try-functions-list
      (list #'try-expand-dabbrev
            #'try-expand-dabbrev-visible
            #'try-expand-dabbrev-from-kill
            #'try-expand-dabbrev-all-buffers
            #'try-complete-file-name-partially
            #'try-complete-file-name))

;; cambia comportamento di default in interattivo
(defadvice kill-ring-save
  (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
                 (message "Copied line") (list (line-beginning-position)
                                               (line-beginning-position 2)))))

(defadvice kill-region
  (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;;; ----------------------------------------------------------------------
;;; paredit mode (gestione automatica delle parentesi)
;;; ----------------------------------------------------------------------
;; incasina gestione region, disabilitato
;; (autoload 'enable-paredit-mode "paredit"
;;   "Turn on pseudo-structural editing of Lisp code."
;;   t)

;; auto-complete everything

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(helm-mode 1)

(message "Globals Loaded!")

(server-start)

(provide 'es-globals)
