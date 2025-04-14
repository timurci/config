(provide 'lang-python)

(setenv "PYENV_VERSION" "3.10.15") ; pyenv will automatically load env

;;; Old Config for Manually Activating Python Environments

;; (setq default-python-venv "~/python_versions/python3.10.12")

;; (use-package pyvenv
;;   :ensure t
;;   :config
;;   (add-hook 'pyvenv-mode-hook (pyvenv-activate default-python-venv)))

(use-package lsp-pyright :ensure t)

;; (add-hook 'python-mode-hook (lambda ()
;; 	  (; (pyvenv-mode)
;; 	   (require 'lsp-pyright))))

(use-package snakemake-mode :ensure t)
