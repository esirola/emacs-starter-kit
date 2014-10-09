;;; ----------------------------------------------------------------------
;;; CLOJURE
;;; ----------------------------------------------------------------------

(require 'es-common)
(require 'smartparens)
(require 'clojure-mode)
(require 'cider)
(require 'ac-cider)

(add-hook 'cider-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-mode-hook 'set-newline-and-indent)
(add-hook 'clojure-mode-hook 'set-newline-and-indent)
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)

(add-hook 'cider-repl-mode-hook 'subword-mode)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(setq cider-repl-result-prefix ";; => ")
(setq cider-interactive-eval-result-prefix ";; => ")
(setq cider-repl-use-clojure-font-lock t)
(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-cider-popup-doc))

(message "Clojure loaded!")

(provide 'es-clojure)
