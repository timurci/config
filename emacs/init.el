;; Packages

(add-to-list 'package-archives
'("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'modus-themes)
  (package-refresh-contents)
  (package-install 'modus-themes))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-packqage))

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
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
(setq electric-pair-pairs (append electric-pair-pairs '((?\{ . ?\})) ))

;; Windows management
(winner-mode t)
(windmove-default-keybindings)

;; Startup
(setq inhibit-startup-message t)
(recentf-open-files

;; Keybinding
(global-set-key (kbd "C-v") (lambda() (interactive) (scroll-up 3)))
(global-set-key (kbd "M-v") (lambda() (interactive) (scroll-down 3)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(package-selected-packages '(counsel swiper modus-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
