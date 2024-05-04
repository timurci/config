(provide 'lang-syntax)

(use-package tree-sitter :ensure t)
(use-package tree-sitter-langs :ensure t)

(add-hook 'prog-mode-hook #'tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
