(provide 'lang-tex)

(use-package auctex
  :ensure t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(with-eval-after-load 'tex
  (add-to-list 'TeX-view-program-selection
               '(output-pdf "Okular")))
