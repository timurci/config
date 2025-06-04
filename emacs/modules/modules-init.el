(provide 'modules-init)

;;; Repositories

(setq package-archives
      '(("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;; (package-initialize)
;; (package-refresh-contents)


;;; Initialize all modules

;; I decided not to add modules to load-path

(require 'modules-essential)

(require 'themes-init "themes/init.el")
(require 'binds-init "binds/init.el")
(require 'lang-init "lang/init.el")
