(unless (file-exists-p "~/.emacs.d/emacs-custom.el")
  (write-region "" nil "~/.emacs.d/emacs-custom.el"))
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;; Packages
(require 'package)
(add-to-list 'package-archives
'("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'modus-themes)
  (package-refresh-contents)
  (package-install 'modus-themes))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-packqage))

(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

(use-package org
  :ensure t
  :config
  (add-hook 'org-mode-hook 'org-indent-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package dashboard
  :ensure t
  :after all-the-icons
  :config
  ;; Set the title
  (setq dashboard-banner-logo-title "Welcome to Emacs")
  ;; Set the banner
  (setq dashboard-startup-banner 'logo)
  ;; Value can be
  ;; - nil to display no banner
  ;; - 'official which displays the official emacs logo
  ;; - 'logo which displays an alternative emacs logo
  ;; - 1, 2 or 3 which displays one of the text banners
  ;; - "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer
  ;; - a cons of '("path/to/your/image.png" . "path/to/your/text.txt")

  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)

  ;; To disable shortcut "jump" indicators for each section, set
  (setq dashboard-show-shortcuts nil)
  (if (package-installed-p 'all-the-icons)
  (progn
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-display-icons-p t)
  (setq dashboard-set-heading-icons nil)
  (setq dashboard-set-file-icons t)))
  (dashboard-setup-startup-hook))

(use-package all-the-icons ; manually run (all-the-icons-install-fonts)
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :ensure t
  :init (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package all-the-icons-ivy
  :ensure t
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup))

(use-package counsel
  :ensure t
  :after ivy
  :config (counsel-mode))

(use-package ivy-posframe
  :ensure t
  :after ivy
  :init
  (add-hook 'after-init-hook
	    '(lambda() (set-face-attribute 'ivy-posframe-border nil :background "#17171a"))) ; border does not properly initialize unless added as a hook
  :config
  (setq ivy-display-functions-alist
	'((counsel-find-file . ivy-posframe-display-at-frame-center)
	  (counsel-M-x . ivy-posframe-display-at-frame-center)
	  (counsel-describe-function . ivy-posframe-display-at-frame-center)
	  (counsel-describe-variable . ivy-posframe-display-at-frame-center)
	  (counsel-describe-symbol . ivy-posframe-display-at-frame-center)
	  (counsel-find-library . ivy-posframe-display-at-frame-center)
	  (counsel-info-lookup-symbol . ivy-posframe-display-at-frame-center)
	  (counsel-unicode-char . ivy-posframe-display-at-frame-center)
	  (counsel-git . ivy-posframe-display-at-frame-center)
	  (counsel-git-grep . ivy-posframe-display-at-frame-center)
	  (counsel-locate . ivy-posframe-display-at-frame-center)
	  (counsel-rythmbox . ivy-posframe-display-at-frame-center)
	  (ivy-completion-in-region . ivy-posframe-display-at-point)))
  (setq ivy-posframe-parameters
      '((left-fringe . 0)
        (right-fringe . 0)
	))
  (setq ivy-posframe-border-width 20)
  (set-face-attribute 'ivy-posframe nil :foreground "#c7c7b0" :background "#17171a")
  )

(use-package ivy-rich
  :ensure t
  :after ivy
  :config (ivy-rich-mode))

(use-package ivy
  :ensure t
  :config
  (ivy-mode)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-use-selectable-prompt t)
  (setq ivy-initial-inputs-alist
	'((counsel-minor . "+")
	 (counsel-package . "+")
	 (counsel-org-capture . "")
	 (counsel-M-x . "")
	 (counsel-describe-symbol . "")
	 (org-refile . "")
	 (org-agenda-refile . "")
	 (org-capture-refile . "")
	 (Man-completion-table . "")
	 (woman . ""))
	))

(use-package swiper
  :ensure t
  :config
  (progn    
    ;; enable this if you want `swiper' to use it
    ;; (setq search-default-mode #'char-fold-to-regexp)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))


;; Lsp

(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t)

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui))

(use-package lsp-mode
  :ensure t
  :config
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;; Modus themes configuration
(setq modus-themes-custom-auto-reload t
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t)


(setq modus-vivendi-palette-overrides
      '(
	;; Redefine colors
	;(bg-main "#262625")
	(bg-main "#201f1f")

	
	;; Mode-line colors
	(border-mode-line-active bg-mode-line-active)
	(border-mode-line-inactive bg-mode-line-inactive)
	(bg-mode-line-active bg-red-subtle)
	(fg-mode-line-active fg-main)

	;; Tab bar colors
	(bg-tab-bar bg-dim)
        (bg-tab-current bg-red-subtle)
        (bg-tab-other bg-red-nuanced)

	;; Fringe colors
	(fringe bg-main)

	;; Prompt colors
	(fg-prompt cyan)
	(bg-prompt bg-cyan-nuanced)

	;; Parenthesis match colors
	(bg-paren-match bg-magenta-intense)
	(underline-paren-match fg-main)

	;; Region colors
	(bg-region bg-sage)
	(fg-region unspecified)

	;; Mouse highlight colors
	(bg-hover bg-yellow-intense) ; not sure what it is

	;; Line number colors
	(fg-line-number-inactive "gray40")
	(fg-line-number-active fg-main)
	;(bg-line-number-inactive unspecified)
      	(bg-line-number-active bg-red-intense)

	;; Cursor colors
	(cursor green-intense)
	(bg-hl-line bg-ochre)

	;; Stuff
	;(name green)
	;(identifier green)

	;; Link colors
	(underline-link border)
	(underline-link-visited border)
	(underline-link-symbolic border)
	(fg-link cyan-intense)
	(fg-link-visited cyan-faint)
	
	;; Syntax colors
	(comment yellow-faint) ; cooler is good too
	(string green-warmer)
	(keyword magenta-cooler)
	(variable red-warmer)
	(type green-cooler)
	(preprocessor red-cooler)
	(constant blue-cooler)
	;(builtin magenta)
        ;(docstring magenta-faint)
        ;(docmarkup green-faint)
        ;(fnname magenta-warmer)
        ;(rx-construct magenta-warmer)
        ;(rx-backslash blue-cooler)
        (underline-err red-faint)
        (underline-warning yellow-faint)
        (underline-note cyan-faint)
	))

(setq modus-themes-common-palette-overrides
      ;; Mode line border (bg-mode-[in]active, unspecified)
      '(
	(border-mode-line-active bg-mode-line-active)
	(border-mode-line-inactive bg-mode-line-inactive)
	))

;; UI Configurations
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

(global-display-line-numbers-mode t)
(global-hl-line-mode t)
(global-tab-line-mode t)
(tab-bar-mode t)
(load-theme 'modus-vivendi t)

;; File conventions
(recentf-mode t)
(save-place-mode t)
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)
(setq ido-enable-flex-matching t)
(ido-mode t)
(ido-everywhere t)


;; Editing conventions
(electric-pair-mode t)
(add-to-list 'electric-pair-pairs '(?\{ . ?\}) )
(setq fill-column 100)

;; Windows management
(winner-mode t)
(windmove-default-keybindings)

;; Keybinding
(global-set-key (kbd "C-v") (lambda() (interactive) (scroll-up 3)))
(global-set-key (kbd "M-v") (lambda() (interactive) (scroll-down 3)))

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; CC mode
(setq-default tab-width 4
			  indent-tabs-mode t) ; Can use tab-to-tab-stop, M-i
(defun my-c-code-hook ()
  (progn
	(c-add-style "custom"
				 '("linux"
				   (c-basic-offset . 4)
				   (c-offsets-alist (access-label . 0))
				   ))
	(setq c-default-style "custom")
	(c-set-style "custom")
	))
(add-hook 'c-mode-hook 'my-c-code-hook)
(add-hook 'c++-mode-hook 'my-c-code-hook)

;; Startup
(setq ring-bell-function 'ignore)
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ; launch emacs maximized
;(setq inhibit-startup-message t)
;(recentf-open-files)
;(setq initial-buffer-choice 'calendar)
(set-face-attribute 'default nil :font "Hack 13" )
(set-frame-font "Hack 13" nil t)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
