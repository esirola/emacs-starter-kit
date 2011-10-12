;;; ----------------------------------------------------------------------
;;; SLIME/CLOJURE
;;; ----------------------------------------------------------------------

;; Customize swank-clojure start-up to reflect possible classpath changes
;; M-x ielm `slime-lisp-implementations RET or see 'swank-clojure.el' for more

(require 'slime)
(require 'paredit)
(require 'clojure-mode)

;; (eval-after-load "slime"
;;   '(progn
;;     ;; "Extra" features (contrib)
;;     (slime-setup
;;      '(slime-repl slime-banner slime-highlight-edits slime-fuzzy))
;;     (setq
;;      ;; Use UTF-8 coding
;;      slime-net-coding-system 'utf-8-unix
;;      ;; Use fuzzy completion (M-Tab)
;;      slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
;;     ;; Use parentheses editting mode paredit
;;     ;;(defun paredit-mode-enable () (paredit-mode 1))
;;     ;;(add-hook 'slime-mode-hook 'paredit-mode-enable)
;;     ;;(add-hook 'slime-repl-mode-hook 'paredit-mode-enable)
;;     ))

;; (eval-after-load "swank-clojure"
;;   '(progn
;;     ;; Make REPL more friendly to Clojure (ELPA does not include this?)
;;     ;; The function is defined in swank-clojure.el but not used?!?
;;     (add-hook 'slime-repl-mode-hook
;;      'swank-clojure-slime-repl-modify-syntax t)
;;     ;; Add classpath for Incanter (just an example)
;;     ;; The preferred way to set classpath is to use swank-clojure-project
;;     (setq swank-clojure-extra-vm-args
;;      '("-Djava.net.preferIPv4Stack=true"))
;;     (dolist (jar (list "~/.homebrew/Cellar/clojure/1.2.0/clojure.jar"
;;                        "~/.homebrew/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar"
;;                        "~/.emacs.d/swank-clojure/swank-clojure-1.3.0-SNAPSHOT.jar" ))
;;       (add-to-list 'swank-clojure-classpath
;;                    jar))))

(message "Clojure loaded!")

(provide 'es-clojure)
