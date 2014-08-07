;; Python Mode

(require 'flycheck)
(require 'jedi)

;;;
;;; python mode configuration - completion and syntax checking
;;; you need to put something like the following in your
;;; .dir-locals.el project file
;;;
;; ((nil
;;   (virtualenv-workon . "ve")
;;   (virtualenv-default-directory . "/Users/esirola/Work/riskapiweb")
;;   (flycheck-python-pylint-executable . "/Users/esirola/Work/riskapiweb/ve/bin/pylint")))
;; ;;; 


(defun my-python-mode-settings ()
  "My Python programming mode settings."
  (interactive)
  (setq indent-tabs-mode nil)
  (set-newline-and-indent)
  (flycheck-mode t)
  (local-set-key (kbd "<f4>") 'insert-python-header))

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'set-newline-and-indent)
(add-hook 'python-mode-hook 'my-python-mode-settings)
(message "Python loaded!")

(provide 'es-python)
