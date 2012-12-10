;;; ----------------------------------------------------------------------
;;; erlang
;;; ----------------------------------------------------------------------

(setq computer (intern (car (split-string system-name "\\."))))
(setq erlang-root-dir
      ;(shell-command-to-string "erl -noinput -eval
                                        ;\"io:format(\\\"~s\\\", [code:root_dir()])\" -run init stop")
      (expand-file-name "~/erlang/R15B01"))

(add-to-list 'exec-path (concat erlang-root-dir "/bin"))

(setq  erlang-load-path
       (concat (shell-command-to-string
                (concat (executable-find "erl")
                        " -noinput -eval \"io:format(\\\"~s\\\", [code:lib_dir(tools)])\" -run init stop"))
               "/emacs")
       erlang-root-man-dir (expand-file-name (concat erlang-root-dir "/man/")))

(add-to-list 'load-path erlang-load-path)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/distel/elisp"))

(setq erlang-man-dirs
      (mapcar (lambda (x) (list (concat "Man - " (car x))
                                (concat erlang-root-man-dir (cdr x)) nil))
              '(("Commands" . "man1")
                ("Modules" . "man3")
                ("Files" . "man4")
                ("Applications" . "man6"))))
  ;; A number of the erlang-extended-mode key bindings are useful in the shell too


(require 'imenu)
(require 'erlang-start)
(require 'erlang-flymake)
(require 'erlang-eunit)
(require 'distel)
(distel-setup)


(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    ("\M-*"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")
  ;; (setq default-frame-alist '((foreground-color . "light grey")
  ;;                             (background-color . "black")
  ;;                             (left . 0) (width . 141) (height . 44)))

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
(defun my-erlang-mode-hook ()
  ;; when starting an Erlang shell in Emacs, default in the node name
  (setq inferior-erlang-machine-options '("-mnesia" "dir" "\"/tmp/mnesia-store\""
                                          "-sname" "emacs"
                                          ;; default uses
                                          ;; ~/.erlang.cookie, which
                                          ;; is fine
                                          ;;"-setcookie" "riak"
                                          ))
  ;; add Erlang functions to an imenu menu
  (imenu-add-to-menubar "Functions")
  ;; customize keys
  (local-set-key [return] 'newline-and-indent)
  )
  ;; Some Erlang customizations

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)

(message "Erlang loaded!")

(provide 'es-erlang)
