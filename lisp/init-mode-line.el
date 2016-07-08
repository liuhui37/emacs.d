;;; Code:

(require-package 'smart-mode-line)
(require-package 'smart-mode-line-powerline-theme)
(require-package 'svg-mode-line-themes)

(add-hook 'after-init-hook
          (lambda () (sml/setup)
            (sml/apply-theme 'automatic)))

(provide 'init-mode-line)

;; Local Variables:
;; coding: utf-8
;; End:

