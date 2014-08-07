
;; header file skeletons
(define-skeleton insert-statpro-license
    "inserts statpro license"
  nil
  comment-start "-----------------------------------------------------------" comment-end \n
  comment-start (concat " Copyright (C) " (substring (current-time-string) -4)
                        " " organization " ")
  comment-end \n
  comment-start "                                                           " comment-end \n
  comment-start " StatPro Italia                                            " comment-end \n
  comment-start " Via de Amicis, 53                                         " comment-end \n
  comment-start " I-20123 Milano                                            " comment-end \n
  comment-start " ITALY                                                     " comment-end \n
  comment-start "                                                           " comment-end \n
  comment-start " phone: +39 02 00693 1                                     " comment-end \n
  comment-start " fax:   +39 02 96875 605                                   " comment-end \n
  comment-start "                                                           " comment-end \n
  comment-start " email: info@statpro.com                                   " comment-end \n
  comment-start "                                                           " comment-end \n
  comment-start " This program is distributed in the hope that it will be   " comment-end \n
  comment-start " useful, but WITHOUT ANY WARRANTY; without even the        " comment-end \n
  comment-start " warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR   " comment-end \n
  comment-start " PURPOSE. See the license for more details.                " comment-end \n
  comment-start "-----------------------------------------------------------" comment-end
  _)

(define-skeleton insert-rst-header
    "inserts a header for rst files"
  nil
  comment-start "-*-rst-*-" comment-end \n
  ":Date: " (current-time-string) \n
  ":Author: " (user-full-name) " <" user-mail-address "> " \n
  ;;   ":Address: Via de Amicis, 53" \n
  ;;   "          20123 Milano\n" \n
  ;;   "          Italia\n" \n
  ":Organization: " organization \n
  ":Copyright: " (substring (current-time-string) -4) " " organization \n \n
  _)


(define-skeleton insert-generic-header
    "inserts a generic header"
  "Description: "
  '(insert-statpro-license)' "" \n
  comment-start " " comment-end  \n
  comment-start " Author: " (user-full-name) " <" user-mail-address "> " comment-end \n
  comment-start " Description: "
  str
  comment-end \n
  comment-start comment-end  \n)

(define-skeleton insert-include-guard
    "inserts an include guard useful in c/c++ headers"
  "Guard name: "
  "#ifndef " str | (downcase (file-name-nondirectory buffer-file-name)) \n
  "#define " str | (downcase (file-name-nondirectory buffer-file-name)) \n \n
  _ \n \n
  "#endif" \n)

(define-skeleton insert-c-header
    "inserts a C / C++ header"
  "Description: "
  '(insert-statpro-license)' "" \n
  \n
  "/*! \\file " (file-name-nondirectory buffer-file-name) \n
  (beginning-of-line) " *  \\brief " str \n
  (beginning-of-line) " */" \n \n
  '(insert-include-guard)' "")

(define-skeleton insert-python-header
    "inserts a Python header"
  "Description: "
  '(insert-statpro-license)' "" \n
  comment-start " " comment-end  \n
  comment-start " Author: " (user-full-name) " <" user-mail-address "> " comment-end \n
  "\"\"\"" str "\"\"\"" \n \n
  \n \n
  "")

;; my special auto-insertion modes
(dolist (insertion '((("\\.hpp\\'" . "C++ header") . insert-c-header)
                     (("\\.h\\'" . "C header") . insert-c-header)
                     (("\\.py\\'" . "Python file") . insert-python-header)))
  (add-to-list 'auto-insert-alist insertion))

(message "Skel loaded!")

(provide 'es-skel)
