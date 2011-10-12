
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
(global-set-key (kbd "C-x g") 'goto-line)
;; tasti funzione
(global-set-key (kbd "<f2>") 'previous-buffer)
(global-set-key (kbd "<f3>") 'next-buffer)
(global-set-key (kbd "<f4>") 'other-window) ; select the other window
(global-set-key (kbd "<S-f4>") 'delete-other-windows) ; remove the other windows
(global-set-key (kbd "<C-f4>") 'delete-window) ; remove the selected window
(global-set-key (kbd "<f5>") 'other-frame)
(global-set-key (kbd "<f12>") 'eshell)
;;; roba per tastiera italiana su mac
;; (when (featurep 'aquamacs)
;;   (global-set-key (kbd "M-\230") "@")
;;   (global-set-key (kbd "M-\223") "~")
;;   (global-set-key (kbd "M-\210") "#")
;;   (global-set-key (kbd "M-ò") "@")
;;   (global-set-key (kbd "M-à") "#")
;;   (global-set-key (kbd "M-ì") "~")
;;   (global-set-key (kbd "M-è") "[")
;;   (global-set-key (kbd "M-+") "]")
;;   (global-set-key (kbd "M-\\") "`"))

;; (autoload 'py-complete-init "py-complete")
;; (add-hook 'python-mode-hook 'py-complete-init)

(message "bindings loaded!")

(provide 'es-bindings)
