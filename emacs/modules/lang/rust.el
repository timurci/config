(provide 'lang-rust)

(use-package rust-mode :ensure t)

(add-hook 'rust-mode-hook
	  (lambda () (setq indent-tabs-mode nil)))
