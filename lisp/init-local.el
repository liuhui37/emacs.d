(set-fontset-font "fontset-startup"
                  nil
                  "Lucida Console-14")

(set-fontset-font "fontset-default"
                  nil
                  "Lucida Console-14")

(set-fontset-font "fontset-default"
                  'han
                  "Hiragino Sans GB W3-14")

(set-fontset-font "fontset-default"
                  'han
                  "STHeiti-14"
                  nil
                  'append)

(set-frame-font "Lucida Console-14")

;; (add-hook 'c-mode-hook
;;                (lambda ()
;;                  (set-frame-font "Lucida Console-18")))

(provide 'init-local)
