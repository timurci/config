(setq custom-file (concat user-emacs-directory "custom.el"))

(require 'package)
(add-to-list 'load-path (concat user-emacs-directory "modules/"))

(require 'modules-init)
