;; ----------------------------------------------------------------------
;; mette a posto i tasti funzione per la tastiera xterm
;; funziona solo con emacs >= 23
;; ----------------------------------------------------------------------

(require 'es-xterm)
(es-apply-xterm-bindings)

;; ----------------------------------------------------------------------
;; carica le features estese di dired
;; ----------------------------------------------------------------------
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            (setq dired-omit-extensions '(".o" ".lo" ".pyc" ".pyo" ".elc" "~"))
            (dired-omit-mode t)
            ))

(autoload (quote dired-jump) "dired" "\
     Jump to Dired buffer corresponding to current buffer.
     If in a file, Dired the current directory and move to file's line.
     If in Dired already, pop up a level and goto old directory's line.
     In case the proper Dired file line cannot be found, refresh the Dired
     buffer and try again." t nil)
(autoload (quote dired-jump-other-window) "dired" "\
     Like \\[dired-jump] (dired-jump) but in other window." t nil)

;;; ----------------------------------------------------------------------
;;; keybindings
;;; ----------------------------------------------------------------------

(global-set-key (kbd "C-l") 'goto-line)
;; (autoload 'py-complete-init "py-complete")
;; (add-hook 'python-mode-hook 'py-complete-init)

(global-set-key (kbd "M-.") 'hippie-expand)

(defun es-switch-buffer ()
  (interactive)
  (anything
   :prompt "Switch to: "
   :candidate-number-limit 10                 ;; up to 10 of each
   :sources
   '( anything-c-source-buffers               ;; buffers
      anything-c-source-recentf               ;; recent files
      anything-c-source-bookmarks             ;; bookmarks
      anything-c-source-files-in-current-dir+ ;; current dir
      anything-c-source-locate))) ;; use 'locate'

(global-set-key (kbd "C-x b") 'es-switch-buffer)
(global-set-key (kbd "<f9>") 'es-switch-buffer)


(global-set-key (kbd "C-c I")  ;; i -> info
  (lambda () (interactive)
    (anything
      :prompt "Info about: "
      :candidate-number-limit 3
      :sources
      '( anything-c-source-info-libc             ;; glibc docs
         anything-c-source-man-pages             ;; man pages
         anything-c-source-info-emacs))))        ;; emacs

;; apri la directory contenente il buffer corrente
(global-set-key (kbd "<f11>") 'dired-jump)
(global-set-key (kbd "S-<f11>") 'dired-jump-other-window)
(global-set-key (kbd "C-<f11>") 'ido-dired)

(global-set-key (kbd "<f1>") 'delete-other-windows)
;; manipolazione finestre + semplice
(global-set-key (kbd "S-<f1>") 'delete-window)
(global-set-key (kbd "<f2>") 'split-window-vertically)
(global-set-key (kbd "S-<f2>") 'split-window-horizontally)
(global-set-key (kbd "<f3>") 'next-buffer)
(global-set-key (kbd "S-<f3>") 'previous-buffer)
(global-set-key (kbd "<f4>") 'next-frame)
(global-set-key (kbd "S-<f4>") 'previous-frame)
(global-set-key (kbd "<f5>") 'other-window)
;; set F8 key to do emacs's C-x
(global-set-key (kbd "<f8>") ctl-x-map)
(global-set-key (kbd "<f7>") 'smex)
;;(global-set-key (kbd "S-<f5>") 'previous-multiframe-window)
;(global-set-key (kbd "M-o") 'other-window)

;; (global-unset-key (kbd "C-x 0"))
;; (global-unset-key (kbd "C-x 1"))
;; (global-unset-key (kbd "C-x 2"))
;; (global-unset-key (kbd "C-x 3"))
;; (global-unset-key (kbd "C-x o"))

;; anche per 'sti due major modes
;(add-hook
; 'dired-mode-hook
; (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window)))
;(add-hook
; 'ibuffer-mode-hook
; (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window)))
;; M-k per uccidere il buffer attuale
;(global-set-key (kbd "M-k") 'kill-this-buffer)
;; ibuffer > list buffers
;(global-set-key (kbd "C-x C-b") 'ibuffer)
;; mark whole buffer
;(global-set-key (kbd "C-x C-a") 'mark-whole-buffer)

;;(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "dv")
;;(require 'ergoemacs-mode)
;;(load "ergoemacs-keybindings-5.3.9/ergoemacs-mode.el")
;;(ergoemacs-mode 1)
(cua-mode 1)
;; in dvorak mappa il C-x in C-t
(message "bindings loaded!")

(provide 'es-bindings)
