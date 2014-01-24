;; ----------------------------------------------------------------------
;; org-mode
;; ----------------------------------------------------------------------

(when (>= emacs-major-version 23)
  (setq diary-file (expand-file-name "~/Dropbox/diary"))
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (setq org-agenda-include-diary t)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c r") 'org-remember)
  (setq org-mobile-directory "~/Dropbox/MobileOrg"
        org-directory "~/Dropbox/org/"
        org-mobile-inbox-for-pull "~/Dropbox/org/from-mobile.org"
        org-default-notes-file (concat org-directory "/notes.org"))
  (add-to-list 'Info-default-directory-list "~/Documents/info/"))

(setq org-hide-leading-stars t
      org-level-color-stars-only nil)

(message "org loaded!")

(provide 'es-org)
