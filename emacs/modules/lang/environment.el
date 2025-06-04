(provide 'lang-environment)

(use-package envrc
  :ensure t
  :hook (after-init . envrc-global-mode))
