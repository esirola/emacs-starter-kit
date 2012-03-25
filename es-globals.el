(require 'cl)
(require 'autoinsert)
(require 'uniquify)
(require 'anything)
(require 'anything-config)

;;;;;;;;;;;;;;;;;;;;;;;
;;; global variables
(defconst organization "StatPro Italia s.r.l.")
(defconst user-mail-address "enrico.sirola@statpro.com")
(defconst frame-title-format
  (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
(defconst european-calendar-style 't)
(global-font-lock-mode t)
(global-hl-line-mode t)
(transient-mark-mode t)
(show-paren-mode t)
(setq calendar-week-start-day 1)
(setq visible-bell t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'find-file-hooks 'auto-insert)
(add-hook 'before-save-hook #'delete-trailing-whitespace)

(line-number-mode 1)
(column-number-mode 1)
(display-time)
(tool-bar-mode -1)
(menu-bar-mode t)
(scroll-bar-mode t)
(cua-mode t)

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
      org-agenda-files '("~/machome/Dropbox/org/progetti.org")
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
                                               (line-beginning-position2)))))

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


(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x b")
  (lambda () (interactive)
    (anything
     :prompt "Switch to: "
     :candidate-number-limit 10                 ;; up to 10 of each
     :sources
     '( anything-c-source-buffers               ;; buffers
        anything-c-source-recentf               ;; recent files
        anything-c-source-bookmarks             ;; bookmarks
        anything-c-source-files-in-current-dir+ ;; current dir
        anything-c-source-locate))))            ;; use 'locate'

(global-set-key (kbd "C-c I")  ;; i -> info
  (lambda () (interactive)
    (anything
      :prompt "Info about: "
      :candidate-number-limit 3
      :sources
      '( anything-c-source-info-libc             ;; glibc docs
         anything-c-source-man-pages             ;; man pages
         anything-c-source-info-emacs))))        ;; emacs

;;; keybindings

;; manipolazione finestre + semplice
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-o") 'other-window)
(global-unset-key (kbd "C-x 0"))
(global-unset-key (kbd "C-x 1"))
(global-unset-key (kbd "C-x 2"))
(global-unset-key (kbd "C-x 3"))
(global-unset-key (kbd "C-x o"))
;; anche per 'sti due major modes
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window)))
(add-hook 'ibuffer-mode-hook (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window)))
;; M-k per uccidere il buffer attuale
(global-set-key (kbd "M-k") 'kill-this-buffer)
;; ibuffer > list buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; mark whole buffer
(global-set-key (kbd "M-a") 'mark-whole-buffer)

(message "Globals Loaded!")

(server-start)

(provide 'es-globals)
