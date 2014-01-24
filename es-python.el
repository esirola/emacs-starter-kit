;; Python Mode
;; (require 'flymake)
;; (require 'flymake-cursor)
(require 'flycheck)
(require 'jedi)

;; (defvar epylint-path "epylint"
;;   "The epylint full path, used by flymake to check python modules.")

;; (when (load "flymake" t)
;;   (defun flymake-pylint-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list epylint-path (list temp-file))))

;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pylint-init)))


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
;(add-hook 'find-file-hook 'flymake-find-file-hook)
(message "Python loaded!")

(provide 'es-python)
