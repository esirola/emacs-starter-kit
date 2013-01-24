;; ----------------------------------------------------------------------
;; mette a posto i tasti funzione per la tastiera xterm
;; funziona solo con emacs >= 23
;; ----------------------------------------------------------------------

(require 'es-xterm)
(es-apply-xterm-bindings)

;;; ----------------------------------------------------------------------
;;; keybindings
;;; ----------------------------------------------------------------------

(global-set-key (kbd "C-l") 'goto-line)
;; (autoload 'py-complete-init "py-complete")
;; (add-hook 'python-mode-hook 'py-complete-init)

(global-set-key (kbd "M-.") 'hippie-expand)

(defun es-switch-buffer ()
  (interactive)
  (helm
   :prompt "Switch to: "
   :candidate-number-limit 20            ;; up to 15 of each
   :sources
   '(helm-c-source-buffers-list               ;; buffers
     helm-c-source-recentf               ;; recent files
     helm-c-source-bookmarks             ;; bookmarks
     helm-c-source-files-in-current-dir  ;; current dir
     helm-c-source-locate)))

;;(global-set-key (kbd "C-x b") 'es-switch-buffer)            ;; use
;;'locate'

(global-set-key (kbd "<f9>") 'es-switch-buffer)

;; (global-set-key (kbd "C-c I")  ;; i -> info
;;   (lambda () (interactive)
;;     (anything
;;       :prompt "Info about: "
;;       :candidate-number-limit 3
;;       :sources
;;       '( anything-c-source-info-libc             ;; glibc docs
;;          anything-c-source-man-pages             ;; man pages
;;          anything-c-source-info-emacs))))        ;; emacs


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
(global-set-key (kbd "<f7>") 'smex)
(global-set-key (kbd "<f10>") 'deft)
(global-set-key (kbd "<f11>") 'dired-jump)
(global-set-key (kbd "S-<f11>") 'dired-jump-other-window)
(global-set-key (kbd "C-<f11>") 'ido-dired)
(global-set-key (kbd "<f12>") 'shell)
(cua-mode 1)


;; set F8 key to do emacs's C-x
(global-set-key (kbd "<f8>") ctl-x-map)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


(message "bindings loaded!")

(provide 'es-bindings)
