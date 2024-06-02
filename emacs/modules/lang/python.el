(provide 'lang-python)

(setq default-python-venv "~/python_versions/python3.10.12")

(use-package pyvenv
  :ensure t
  :config
  (add-hook 'pyvenv-mode-hook (pyvenv-activate default-python-venv)))

(use-package lsp-pyright :ensure t)

(add-hook 'python-mode-hook (lambda ()
	  ((pyvenv-mode)
	   (require 'lsp-pyright))))
