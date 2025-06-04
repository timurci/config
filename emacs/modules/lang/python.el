(provide 'lang-python)

;; (setenv "PYENV_VERSION" "3.10.15") ; pyenv will automatically load env

;;; Old Config for Manually Activating Python Environments

(defvar default-python-venv "~/.pyenv/versions/3.10.15")

(use-package pyvenv
  :ensure t
  :config
  (setenv "WORKON_HOME" "~/.pyenv/versions")
  (pyvenv-activate default-python-venv))

(use-package lsp-pyright :ensure t)
(use-package snakemake-mode :ensure t)
