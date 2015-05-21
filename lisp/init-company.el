(require-package 'company)
(require-package 'company-c-headers)
(require-package 'function-args)
(require-package 'irony)
(require-package 'company-irony)

(require 'cc-mode)

;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;; (delete 'company-semantic company-backends)
(define-key c-mode-map  [(control tab)] 'company-complete)
(define-key c++-mode-map  [(control tab)] 'company-complete)

;; company-c-headers
(require 'company-c-headers)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-c-headers))

;; function-args
(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(tab)] 'moo-complete)
(define-key c++-mode-map  [(tab)] 'moo-complete)

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; irony
(require 'irony)

(defun check-irony-hooks ()
  ;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode
  (when (member major-mode irony-supported-major-modes)
    (irony-mode 1))
  )

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  ;; echo "" | g++ -v -x c++ -E -
  ;; ;; set compiler flags to include header files
  ;; (setq irony-compile-flags '("-Iinc"))
  ;; (irony-reload-flags)
  ;; http://stackoverflow.com/questions/20266303/irony-mode-does-not-pick-up-include-paths
  (setq irony-additional-clang-options
        (append '("-I" "inc" "-I" "../inc" "-I" "include" "-I" "../include") irony-additional-clang-options))
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; company-irony
(require 'company-irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(provide 'init-company)
