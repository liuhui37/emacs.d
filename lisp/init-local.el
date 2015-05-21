(defvar preferred-fonts-list)
(defvar preferred-han-fonts-list)

(when *is-a-linux*
  (progn
    (setq preferred-fonts-list '("Andale Mono-12"))
    (setq preferred-han-fonts-list '("文泉驿等宽正黑-12"))))
(when *is-a-mac*
  (progn
    (setq preferred-fonts-list '("Lucida Console-14" "Andale Mono-13"))
    (setq preferred-han-fonts-list '("Hiragino Sans GB W3-14" "STHeiti-14"))))

(dolist (preferred-font preferred-fonts-list)
  (set-fontset-font "fontset-startup"
                    nil
                    preferred-font
                    nil
                    'prepend)
  (set-fontset-font "fontset-default"
                    nil
                    preferred-font
                    nil
                    'prepend)
  (set-frame-font preferred-font))

(dolist (preferred-han-font preferred-han-fonts-list)
  (set-fontset-font "fontset-startup"
                    'han
                    preferred-han-font
                    nil
                    'prepend)
  (set-fontset-font "fontset-default"
                    'han
                    preferred-han-font
                    nil
                    'prepend))

;;;; (add-hook 'c-mode-hook
;;;;                (lambda ()
;;;;                  (set-frame-font "Lucida Console-18")))

(provide 'init-local)
