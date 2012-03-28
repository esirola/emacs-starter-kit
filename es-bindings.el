
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
(global-set-key (kbd "C-x C-j") 'dired-jump)
(global-set-key (kbd "C-x 4 C-j") 'dired-jump-other-window)
(autoload (quote dired-jump) "dired" "\
     Jump to Dired buffer corresponding to current buffer.
     If in a file, Dired the current directory and move to file's line.
     If in Dired already, pop up a level and goto old directory's line.
     In case the proper Dired file line cannot be found, refresh the Dired
     buffer and try again." t nil)
(autoload (quote dired-jump-other-window) "dired" "\
     Like \\[dired-jump] (dired-jump) but in other window." t nil)
;; ----------------------------------------------------------------------
(global-set-key (kbd "C-l") 'goto-line)
;; tasti funzione
(global-set-key (kbd "<f2>") 'previous-buffer)
(global-set-key (kbd "<f3>") 'next-buffer)
(global-set-key (kbd "<f4>") 'other-window) ; select the other window
(global-set-key (kbd "<S-f4>") 'delete-other-windows) ; remove the other windows
(global-set-key (kbd "<C-f4>") 'delete-window) ; remove the selected window
(global-set-key (kbd "<f5>") 'other-frame)
(global-set-key (kbd "<f12>") 'eshell)
;; (autoload 'py-complete-init "py-complete")
;; (add-hook 'python-mode-hook 'py-complete-init)

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
(add-hook
 'dired-mode-hook
 (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window)))
(add-hook
 'ibuffer-mode-hook
 (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window)))
;; M-k per uccidere il buffer attuale
(global-set-key (kbd "M-k") 'kill-this-buffer)
;; ibuffer > list buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; mark whole buffer
(global-set-key (kbd "M-a") 'mark-whole-buffer)

(message "bindings loaded!")

(provide 'es-bindings)
