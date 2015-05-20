(ignore-errors
  (require-package 'erlang))

(when (package-installed-p 'erlang)
  (require 'erlang-start))

(after-load 'auto-complete
  (add-to-list 'ac-modes 'erlang-mode))

(provide 'init-erlang)
