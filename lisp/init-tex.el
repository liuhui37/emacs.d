;;; Code:

(require-package 'auctex)
(require-package 'auctex-lua)
(require-package 'company)
(require-package 'company-auctex)

;; Auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)
(setq TeX-default-mode 'context-en-mode)

(add-hook 'ConTeXt-mode-hook
          '(lambda ()
             (add-to-list 'TeX-command-list '("ConTeXt MkIV" "context %(execopts)%t" TeX-run-TeX nil (context-mode)))
             (setq TeX-command-default "ConTeXt MkIV")
             (setq TeX-engine 'luatex)))

(provide 'init-tex)

;;; Local Variables:
;;; coding: utf-8
;;; End:

;;; init-tex.el ends here
