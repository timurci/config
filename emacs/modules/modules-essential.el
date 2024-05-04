;;;; Essential configurations

(provide 'modules-essential)

;;; Utilities

;; Keep track of recently opened files
(recentf-mode 1)

;; Settings for backup files
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backup")))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 5   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )


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
