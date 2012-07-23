(require 'cl)
(require 'autoinsert)
(require 'uniquify)
(require 'anything)
(require 'anything-config)

;;;------------------------------------------------------------
;;; global variables
;;;------------------------------------------------------------

(defconst organization "StatPro Italia s.r.l.")
(defconst user-mail-address "enrico.sirola@statpro.com")
(defconst frame-title-format
  (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
(defconst european-calendar-style 't)

(global-font-lock-mode t)
(transient-mark-mode t)
(show-paren-mode t)
(setq calendar-week-start-day 1)
(setq visible-bell t)
(setq-default save-place t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'find-file-hooks 'auto-insert)
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'shell-hook 'ansi-color-for-comint-mode-on)

(line-number-mode 1)
(column-number-mode 1)
(display-time)
(tool-bar-mode -1)
(menu-bar-mode t)
;;(cua-mode t)
;;(ffap-bindings)
(ido-mode t)
(recentf-mode 1)

(when window-system
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



(message "Globals Loaded!")

(server-start)

(provide 'es-globals)
