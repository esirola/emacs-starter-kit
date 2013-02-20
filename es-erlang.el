;;; ----------------------------------------------------------------------
;;; erlang
;;; ----------------------------------------------------------------------

(defun es-erlang-mode-hook ()
  ;; when starting an Erlang shell in Emacs, default in the node name
  ;; add Erlang functions to an imenu menu
  (imenu-add-to-menubar "Functions")
  ;; customize keys
  (local-set-key [return] 'newline-and-indent))

(defun ebin-dirs (root)
  (let ((myebin (list (concat root "/ebin")))
        (deps-ebins (file-expand-wildcards (concat root "/deps/*/ebin")))
        (apps-ebins (file-expand-wildcards (concat root "/apps/*/ebin"))))
    (remove-if-not #'file-exists-p (nconc myebin deps-ebins apps-ebins))))

(defun erl-pa-directives (dirs)
  (apply #'nconc (mapcar (lambda (x) (list "-pa" x)) dirs)))

(defun es-erlang-setup ()
 (add-to-list 'exec-path (concat es-erlang-root-dir "/bin"))

 (let* ((libdir (concat es-erlang-root-dir "/lib/"))
        (eloadpath
         (expand-file-name (concat
                            libdir
                            (file-name-completion "tools" libdir)
                            "emacs")))
        (emandir (expand-file-name
                  (concat es-erlang-root-dir "/man/"))))
   (add-to-list 'load-path eloadpath)
   (setq erlang-man-dirs
         (mapcar (lambda (x) (list (concat "Man - " (car x))
                              (concat emandir (cdr x)) nil))
                 '(("Commands" . "man1")
                   ("Modules" . "man3")
                   ("Files" . "man4")
                   ("Applications" . "man6")))))

 (require 'imenu)
 (require 'erlang-start)
 (require 'erlang-flymake)
 (require 'erlang-eunit)

 (defconst distel-shell-keys
   '(("\C-\M-i"   erl-complete)
     ("\M-?"      erl-complete)
     ("\M-."      erl-find-source-under-point)
     ("\M-,"      erl-find-source-unwind)
     ("\M-*"      erl-find-source-unwind)
     )
   "Additional keys to bind when in Erlang shell.")

 (let ((distel-elisp-root (concat es-distel-root-dir
                                  "/elisp"))
       (erl-pa-dirs (erl-pa-directives (ebin-dirs es-erlang-project-root))))
   ;; in case distel is installed, activate it
   (cond ((file-exists-p distel-elisp-root)
          (add-to-list 'load-path (expand-file-name distel-elisp-root))
          (require 'distel)
          (distel-setup)
          (add-hook 'erlang-shell-mode-hook
                    (lambda ()
                      ;; add some Distel bindings to the Erlang shell
                      (dolist (spec distel-shell-keys)
                        (define-key erlang-shell-mode-map (car spec) (cadr spec)))))
          ;; tell distel to default to that node
          (setq erl-nodename-cache
                (make-symbol
                 (concat
                  "emacs@"
                  ;; Mac OS X uses "name.local" instead of "name", this should work
                  ;; pretty much anywhere without having to muck with NetInfo
                  ;; ... but I only tested it on Mac OS X.
                  (car (split-string (shell-command-to-string "hostname"))))))
          (setq inferior-erlang-machine-options (nconc
                                                 '("-mnesia" "dir" "\"/tmp/mnesia-store\""
                                                   "-sname" "emacs"
                                                   ;; default uses
                                                   ;; ~/.erlang.cookie, which
                                                   ;; is fine
                                                   ;;"-setcookie" "riak"
                                                   )
                                                 erl-pa-dirs)))
         ;; otherwise, just leave a message
         (t
          (message "Cannot load distel, check your path"))))
 (when (featurep 'auto-complete)
   (dolist (m '(erlang-shell-mode erlang-mode))
     (add-to-list 'ac-modes m)))
 (add-hook 'erlang-mode-hook 'es-erlang-mode-hook)
 (add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))
 (message "executing erlang mode")
 (erlang-mode))

(message "Erlang loaded!")

(provide 'es-erlang)
 
