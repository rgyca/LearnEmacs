;;; init-face
;;;Themes and modeline


;;; If not use color theme, below is another self-defined window-system face
;; (set-face-italic-p 'region t)
;; (set-background-color "DarkSlateGrey")
;; (set-foreground-color "Wheat")
;; (set-cursor-color "Orchid") 
;; (set-face-attribute 'fringe nil
;;                     :foreground "SpringGreen4"
;;                     :background "DarkSlateGrey")
;; ;(set-face-attribute 'default nil :height 160)

;; (setq-default  default-frame-alist
;;                `(
;; 		 (cursor-height . 4)
;; 		 (cursor-type . (bar . 2))
;; 		 ;;box, bar, caret, hairline-caret, checkered-caret
;; 		 (cursor-color . "Orchid")
;; 		 (mouse-color  . "Orchid")
;; 		 (user-size . t)
;; 		 (top . 0) 
;; 		 (left . 0) 
;; 		 (height . 45) 
;; 		 (width . 90) 
;; 		 ))




;; (use-package zenburn-theme
;;   :ensure t)
;; (use-package faff-theme
;;   :ensure t)
;; (load-theme 'zenburn t)

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode 1))


;;show time and month on th modeline
(setq display-time-format "%m月%d日（%A）%H:%M")
(setq display-time-default-load-average nil)
(display-time-mode 1) 
(display-battery-mode 1)

(provide 'init-theme)
;;; init-face.el ends here.
