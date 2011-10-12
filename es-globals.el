(require 'cl)
(ignore-errors (require 'tramp))
(require 'autoinsert)
(add-hook 'find-file-hooks 'auto-insert)
(global-font-lock-mode t)
(global-hl-line-mode t)
(transient-mark-mode t)
(show-paren-mode t)
(setq calendar-week-start-day 1)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(line-number-mode 1)
(column-number-mode 1)
(display-time)
(setq-default show-trailing-whitespace t
              indicate-empty-lines t)
(put 'scroll-left 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq bookmark-default-file "~/.emacs-bookmarks" ;; keep my ~/ clean
      bookmark-save-flag 1)                        ;; autosave each change)
(tool-bar-mode -1)

(ignore-errors
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward))

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

;;;;;;;;;;;;;;;;;;;;;;;
;;; global variables
(defconst organization "StatPro Italia s.r.l.")
(defconst user-mail-address "enrico.sirola@statpro.com")
(defconst frame-title-format
  (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
(defconst european-calendar-style 't)
(setq-default indent-tabs-mode nil)
(setq home (concat (getenv "HOME") "/"))
(setq dot-emacs-dir (concat home ".emacs.d/"))

;;; ----------------------------------------------------------------------
;;; paredit mode (gestione automatica delle parentesi)
;;; ----------------------------------------------------------------------
;; incasina gestione region, disabilitato
;; (autoload 'enable-paredit-mode "paredit"
;;   "Turn on pseudo-structural editing of Lisp code."
;;   t)

(setq hippie-expand-try-functions-list
      (list #'try-expand-dabbrev
            #'try-expand-dabbrev-visible
            #'try-expand-dabbrev-from-kill
            #'try-expand-dabbrev-all-buffers
            #'try-complete-file-name-partially
            #'try-complete-file-name))
;;(global-set-key (kbd "C-<tab>") 'hippie-expand)
(global-set-key (kbd "M-/") 'hippie-expand)

(message "Globals Loaded!")

(provide 'es-globals)
