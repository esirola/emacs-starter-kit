;;; ----------------------------------------------------------------------
;;; xterm settings for function keys
;;; ----------------------------------------------------------------------


(defun es-apply-xterm-bindings ()
  "Bindings for Fun keys with modifiers, as passed by the xterm/sun/pc keyboards."
  (interactive)
  ;; f1 modifiers
  (when (>= emacs-major-version 23)
    (define-key input-decode-map "\e[1;2P" [S-f1])
    (define-key input-decode-map "\e[1;3P" [M-f1])
    (define-key input-decode-map "\e[1;4P" [M-S-f1])
    (define-key input-decode-map "\e[1;5P" [C-f1])
    (define-key input-decode-map "\e[1;6P" [C-S-f1])
    (define-key input-decode-map "\e[1;7P" [M-C-f1])
    (define-key input-decode-map "\e[1;8P" [M-C-S-f1])

    ;; f2 modifiers
    (define-key input-decode-map "\e[1;2Q" [S-f2])
    (define-key input-decode-map "\e[1;3Q" [M-f2])
    (define-key input-decode-map "\e[1;4Q" [M-S-f2])
    (define-key input-decode-map "\e[1;5Q" [C-f2])
    (define-key input-decode-map "\e[1;6Q" [C-S-f2])
    (define-key input-decode-map "\e[1;7Q" [M-C-f2])
    (define-key input-decode-map "\e[1;8Q" [M-C-S-f2])

    ;; f3 modifiers
    (define-key input-decode-map "\e[1;2R" [S-f3])
    (define-key input-decode-map "\e[1;3R" [M-f3])
    (define-key input-decode-map "\e[1;4R" [M-S-f3])
    (define-key input-decode-map "\e[1;5R" [C-f3])
    (define-key input-decode-map "\e[1;6R" [C-S-f3])
    (define-key input-decode-map "\e[1;7R" [M-C-f3])
    (define-key input-decode-map "\e[1;8R" [M-C-S-f3])

    ;; f4 modifiers
    (define-key input-decode-map "\e[1;2S" [S-f4])
    (define-key input-decode-map "\e[1;3S" [M-f4])
    (define-key input-decode-map "\e[1;4S" [M-S-f4])
    (define-key input-decode-map "\e[1;5S" [C-f4])
    (define-key input-decode-map "\e[1;6S" [C-S-f4])
    (define-key input-decode-map "\e[1;7S" [M-C-f4])
    (define-key input-decode-map "\e[1;8S" [M-C-S-f4])

    ;; f5 modifiers
    (define-key input-decode-map "\e[15;2~" [S-f5])
    (define-key input-decode-map "\e[15;3~" [M-f5])
    (define-key input-decode-map "\e[15;4~" [M-S-f5])
    (define-key input-decode-map "\e[15;5~" [C-f5])
    (define-key input-decode-map "\e[15;6~" [C-S-f5])
    (define-key input-decode-map "\e[15;7~" [M-C-f5])
    (define-key input-decode-map "\e[15;8~" [M-C-S-f5])

    ;; f6 modifiers
    (define-key input-decode-map "\e[17;2~" [S-f6])
    (define-key input-decode-map "\e[17;3~" [M-f6])
    (define-key input-decode-map "\e[17;4~" [M-S-f6])
    (define-key input-decode-map "\e[17;5~" [C-f6])
    (define-key input-decode-map "\e[17;6~" [C-S-f6])
    (define-key input-decode-map "\e[17;7~" [M-C-f6])
    (define-key input-decode-map "\e[17;8~" [M-C-S-f6])

    ;; f7 modifiers
    (define-key input-decode-map "\e[18;2~" [S-f7])
    (define-key input-decode-map "\e[18;3~" [M-f7])
    (define-key input-decode-map "\e[18;4~" [M-S-f7])
    (define-key input-decode-map "\e[18;5~" [C-f7])
    (define-key input-decode-map "\e[18;6~" [C-S-f7])
    (define-key input-decode-map "\e[18;7~" [M-C-f7])
    (define-key input-decode-map "\e[18;8~" [M-C-S-f7])

    ;; f8 modifiers
    (define-key input-decode-map "\e[19;2~" [S-f8])
    (define-key input-decode-map "\e[19;3~" [M-f8])
    (define-key input-decode-map "\e[19;4~" [M-S-f8])
    (define-key input-decode-map "\e[19;5~" [C-f8])
    (define-key input-decode-map "\e[19;6~" [C-S-f8])
    (define-key input-decode-map "\e[19;7~" [M-C-f8])
    (define-key input-decode-map "\e[19;8~" [M-C-S-f8])

    ;; f9 modifiers
    (define-key input-decode-map "\e[20;2~" [S-f9])
    (define-key input-decode-map "\e[20;3~" [M-f9])
    (define-key input-decode-map "\e[20;4~" [M-S-f9])
    (define-key input-decode-map "\e[20;5~" [C-f9])
    (define-key input-decode-map "\e[20;6~" [C-S-f9])
    (define-key input-decode-map "\e[20;7~" [M-C-f9])
    (define-key input-decode-map "\e[20;8~" [M-C-S-f9])

    ;; f10 modifiers
    (define-key input-decode-map "\e[21;2~" [S-f10])
    (define-key input-decode-map "\e[21;3~" [M-f10])
    (define-key input-decode-map "\e[21;4~" [M-S-f10])
    (define-key input-decode-map "\e[21;5~" [C-f10])
    (define-key input-decode-map "\e[21;6~" [C-S-f10])
    (define-key input-decode-map "\e[21;7~" [M-C-f10])
    (define-key input-decode-map "\e[21;8~" [M-C-S-f10])

    ;; f11 modifiers
    (define-key input-decode-map "\e[23;2~" [S-f11])
    (define-key input-decode-map "\e[23;3~" [M-f11])
    (define-key input-decode-map "\e[23;4~" [M-S-f11])
    (define-key input-decode-map "\e[23;5~" [C-f11])
    (define-key input-decode-map "\e[23;6~" [C-S-f11])
    (define-key input-decode-map "\e[23;7~" [M-C-f11])
    (define-key input-decode-map "\e[23;8~" [M-C-S-f11])

    ;; f12 modifiers
    (define-key input-decode-map "\e[24;2~" [S-f12])
    (define-key input-decode-map "\e[24;3~" [M-f12])
    (define-key input-decode-map "\e[24;4~" [M-S-f12])
    (define-key input-decode-map "\e[24;5~" [C-f12])
    (define-key input-decode-map "\e[24;6~" [C-S-f12])
    (define-key input-decode-map "\e[24;7~" [M-C-f12])
    (define-key input-decode-map "\e[24;8~" [M-C-S-f12])))

(provide 'es-xterm)
