(provide 'themes-basic-setup)

;;; Font Configuration

(setq font-name "Hack")
(setq font-size 14)

(cond
 ((find-font (font-spec :name font-name)) ; if font-name exists
  (set-frame-font (concat font-name " " (number-to-string font-size))))
 (t ; else, only set font-size
  (set-face-attribute 'default nil :height 140)))

;;; Window components

;; Display line numbers
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Disable bars
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Tab bar
(tab-bar-mode 1)

(setq tab-bar-new-button-show nil)
(setq tab-bar-close-button-show nil)
(setq tab-bar-separator " ")

;; Margins
;; (setq-default left-margin-width 1 right-margin-width 1)
(set-frame-parameter nil 'internal-border-width 1)


;; Disable fringes
(fringe-mode '(8 . 8))
