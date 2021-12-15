;;; init-dashboard

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package page-break-lines
  :ensure t)
(use-package projectile
  :ensure t)

(use-package dashboard
  :ensure t
  :after all-the-icons
  :diminish (dashboard-mode page-break-lines-mode)
  :config
  ;; Set the title
  (setq dashboard-banner-logo-title "今天过得怎么样？")

  ;; Set the banner
  (setq dashboard-startup-banner "~/.emacs.d/db3.png") ;dash2.png");;Dash.png")
  (setq dashboard-set-init-info nil)
  (setq dashboard-show-shortcuts t)
  (setq dashboard-week-agenda t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-items '((bookmarks . 5)
                          (agenda . 5)
			  (recents  . 4)
					;(projects . 5)
					;(registers . 5)
			  ))

  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)

  ;;footer information
  (setq dashboard-set-footer t)
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                     :height 1.1
                                                     :v-adjust -0.05
                                                     :face 'font-lock-keyword-face))
  (setq dashboard-footer-messages '("Emacs,org,gtd,roam,latex,pdfview！"))

  :custom
  (dashboard-center-content t)
  :custom-face
  (dashboard-heading ((t (:foreground "#f75f5f" :weight bold ))))
  (dashboard-items-face ((t ( ))))
  (dashboard-banner-logo-title ((t (:foreground "#ffaf5f" :weight bold))))
  :hook
  (after-init . dashboard-setup-startup-hook)  )

;; Format: "(icon title help action face prefix suffix)"
;; (setq dashboard-navigator-buttons
;;       `(;; line1
;;         ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
;;          "Homepage"
;;          "Browse homepage"
;;          (lambda (&rest _) (browse-url "www.baidu.com")))
;;         ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
;;         ("?" "" "?/h" #'show-help nil "<" ">"))
;;          ;; line 2
;;         ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
;;           "Linkedin"
;;           ""
;;           (lambda (&rest _) (browse-url "homepage")))
;;          ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))

(provide 'init-dashboard)
;;; init-dashboard.el ends here.
