;;;; Essential configurations

(provide 'modules-essential)

;;; Startup options

(setq frame-resize-pixelwise t)

;; Set initial buffer to *scratch*
(setq initial-buffer-choice t)

;; Set initial frame options
(add-to-list 'initial-frame-alist '(fullscreen . maximized))


;;; Minibuffer

;; Max. minibuffer height
(setq max-mini-window-height 0.10)

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

;;; Programming

;; Automatic parens pairing
(add-hook 'prog-mode-hook 'electric-pair-local-mode)
