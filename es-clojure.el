;;; ----------------------------------------------------------------------
;;; CLOJURE
;;; ----------------------------------------------------------------------
(ignore-errors
  (require 'es-common)
  (require 'paredit)
  (require 'clojure-mode)
  (require 'cider)
  (require 'ac-nrepl)

  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'nrepl-mode))

  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'set-newline-and-indent)
  (add-hook 'nrepl-interaction-mode-hook 'cider-turn-on-eldoc-mode)
  (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)

  (add-hook 'cider-repl-mode-hook 'subword-mode)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)

  (defun set-auto-complete-as-completion-at-point-function ()
    (setq completion-at-point-functions '(auto-complete)))

  (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

  (add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
  (add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)

                                        ;(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

  (message "Clojure loaded!"))

(provide 'es-clojure)
