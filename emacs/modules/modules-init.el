(provide 'modules-init)

;;; Repositories

(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; (package-initialize)
;; (package-refresh-contents)


;;; Initialize all modules

;; I decided not to add modules to load-path

(require 'modules-essential)

(require 'themes-init "themes/init.el")
(require 'binds-init "binds/init.el")
(require 'lang-init "lang/init.el")
