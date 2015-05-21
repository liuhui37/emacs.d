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
(setq TeX-output-view-style
      (quote
       (("^pdf$" "." "evince -f %o")
        ("^html?$" "." "iceweasel %o"))))

(setq TeX-default-mode 'context-mode)


;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(add-hook 'LaTeX-mode-hook
          #'(lambda ()
              (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-default "XeLaTeX")
              (setq TeX-view-program-selection '((output-pdf "Evince")
                                                 (output-dvi "Evince")))))

(add-hook 'ConTeXt-mode-hook
	  '(lambda()
	     (add-to-list 'TeX-command-list '("ConTeXt MkIV" "context %(execopts)%t" TeX-run-TeX nil (context-mode)))
	     (setq TeX-command-default "ConTeXt MkIV")
	     (setq TeX-engine 'luatex)))

(provide 'init-tex)

;;; Local Variables:
;;; coding: utf-8
;;; End:

