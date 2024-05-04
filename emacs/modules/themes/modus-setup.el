(provide 'themes-modus-setup)

(defun my-modus-themes-custom-faces (&rest _)
  (modus-themes-with-colors
    (custom-set-faces
     `(tab-bar-tab ((,c :underline (:color ,red-intense :position t))))
     `(tab-bar ((,c :box (:color ,bg-main :line-width (0 . 8))))
	       )
     )))

(use-package modus-themes
  :ensure t
  :config
  
  (setq modus-themes-custom-auto-reload t)
  (setq modus-themes-to-toggle '(modus-operandi modus-vivendi))

  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs nil
	modus-themes-mixed-fonts t
	modus-themes-variable-pitch-ui nil
	modus-themes-custom-auto-reload t
	modus-themes-disable-other-themes t)
  
  (setq modus-themes-common-palette-overrides
	'((fringe unspecified)
	  (border-mode-line-active unspecified)
	  (border-mode-line-inactive unspecified)
	  (bg-tab-bar bg-main)
	  (bg-tab-other bg-main)
	  ))
  
  (setq modus-operandi-palette-overrides
	'())
  (setq modus-vivendi-palette-overrides
	'())

  (add-hook 'modus-themes-after-load-theme-hook #'my-modus-themes-custom-faces)
  
  (modus-themes-load-theme 'modus-vivendi))
