(provide 'binds-key-global)


(use-package ace-window
  :ensure t)

;;; Without Prefix

(keymap-global-set "M-o" 'ace-window)
