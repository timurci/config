(provide 'themes-mode-line)

(setq-default
 mode-line-format
 (list

  "%e"
  mode-line-front-space

  mode-line-mule-info
  mode-line-client
  mode-line-modified
  mode-line-remote

  mode-line-frame-identification
  mode-line-buffer-identification

  "   "
  mode-line-position
  '(vc-mode vc-mode)
  "   "
  
  mode-line-end-spaces))

(setq column-number-mode t)
