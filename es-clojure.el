;;; ----------------------------------------------------------------------
;;; SLIME/CLOJURE
;;; ----------------------------------------------------------------------

;; Customize swank-clojure start-up to reflect possible classpath changes
;; M-x ielm `slime-lisp-implementations RET or see 'swank-clojure.el' for more

(require 'slime)
(require 'paredit)
(require 'clojure-mode)
(require 'es-common)

(eval-after-load "slime"
  '(progn
    ;; "Extra" features (contrib)
    (slime-setup
     '(slime-repl slime-banner slime-highlight-edits slime-fuzzy))
    (setq
     ;; Use UTF-8 coding
     slime-net-coding-system 'utf-8-unix
     ;; Use fuzzy completion (M-Tab)
     slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
    ;; Use parentheses editting mode paredit
    (add-hook 'slime-mode-hook 'paredit-mode-enable)
    ))

(eval-after-load "swank-clojure"
  '(progn
    ;; Make REPL more friendly to Clojure (ELPA does not include this?)
    ;; The function is defined in swank-clojure.el but not used?!?
    (add-hook 'slime-repl-mode-hook 'swank-clojure-slime-repl-modify-syntax t)))

(message "Clojure loaded!")

(provide 'es-clojure)
