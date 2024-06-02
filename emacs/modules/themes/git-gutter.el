(provide 'themes-git-gutter)

(use-package git-gutter
  :ensure t
  :init
  (setq global-linum-mode nil)
  (global-git-gutter-mode 1)
  :config
  (custom-set-variables
   '(git-gutter:window-width 1)
   '(git-gutter:modified-sign "▍")
   '(git-gutter:added-sign "▍")
   '(git-gutter:deleted-sign "▍")))

;; Also see git-gutter color overrides at themes-modus-setup
