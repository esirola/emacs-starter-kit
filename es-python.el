;; Python Mode
(defun my-python-mode-settings ()
  "My Python programming mode settings."
  (interactive)
  (setq indent-tabs-mode nil)
  (set-newline-and-indent)
  (local-set-key (kbd "<f4>") 'insert-python-header))

(when (locate-library "python-mode")
  (add-hook 'python-mode-hook 'my-python-mode-settings)
  (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
  (autoload 'python-mode "python-mode"))

;; (when (load "flymake" t)
;;   ;; python support
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pyflakes" (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init))
;;   (add-hook 'find-file-hook 'flymake-find-file-hook))

(when (load "flymake" t)
  ;; python support
  (defun flymake-epylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "epylint" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-epylint-init))
  (add-hook 'find-file-hook 'flymake-find-file-hook))

(message "Python loaded!")

(provide 'es-python)
