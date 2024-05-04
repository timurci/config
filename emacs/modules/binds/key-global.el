(provide 'binds-key-global)

;;; Dependencies

(use-package which-key :ensure t :config (which-key-mode))
(use-package ace-window :ensure t)
;; modus-themes @ themes/modus-setup.el


;;; Without Prefix

;; Easy switch to other windows + other features
(keymap-global-set "M-o" 'ace-window)

;; Switch between two pre-selected themes in modus-themes
(keymap-global-set "<f5>" #'modus-themes-toggle)

;; Window split auto-focus
(keymap-global-set "C-x 2" (lambda () (interactive)
			     (split-window-vertically)
			     (other-window 1)))
(keymap-global-set "C-x 3" (lambda () (interactive)
			     (split-window-horizontally)
			     (other-window 1)))

;;; With prefix

;; Function: Return a composition of key with a prefix
(defun composed (key &optional prefix)
  "Return a composition of key with a prefix. Default prefix is 'C-c'"
  (unless prefix (setq prefix "C-c"))
  (concat prefix " " key))

;; List recently opened files
(keymap-global-set (composed "C-o") 'recentf-open-files)

;; Lsp-mode @ lang/lsp.el
;; (setq lsp-keymap-prefix "C-c l")
