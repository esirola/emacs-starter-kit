;;; ----------------------------------------------------------------------
;;; CLOJURE
;;; ----------------------------------------------------------------------
(ignore-errors
  (require 'es-common)
  (require 'clojure-mode)
  (require 'cider)
  (require 'ac-nrepl)

  (setq cider-repl-use-clojure-font-lock t)
  (setq cider-repl-result-prefix ";; => ")
  (add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
  (add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
  (add-hook 'cider-repl-mode-hook 'subword-mode)
  (add-hook 'cider-mode-hook 'ac-nrepl-setup)
  (add-hook 'clojure-mode-hook 'set-newline-and-indent)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'cider-repl-mode))
  (eval-after-load "cider"
    '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))
  (message "Clojure loaded!"))

(provide 'es-clojure)
