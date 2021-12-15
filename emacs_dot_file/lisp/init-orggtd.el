;;org-gtd

;;; GTD 

(setq org-directory "~/Org/")
(setq org-agenda-files
      '("~/Org/gtd/gtd.org"
             ))

(setq org-todo-keywords
      '((sequence "TODO(t!)" "APPT(p@/!)" "HOLD(h!)" "|" "DONE(d@/!)" )
        (sequence "NEXT(n!)"  "WAITING(w@/!)" "|" "CANCELED(c@/!)")
     )) 
(setq org-todo-keyword-faces
      '(("TODO"  . (:foreground "firebrick1" :weight bold)) 
        ("WAITING"  . (:foreground "green" :weight bold))
        ("APPT"  . (:foreground "yellow" :weight bold))
        ("HOLD"  . (:foreground "coral" :weight bold))
        ("NEXT"  . (:foreground "blue" :weight bold))
        ("DONE"  . (:foreground "white" :weight bold))
        ("CANCELED"  . (:foreground "black" :weight bold))
        ))

(global-set-key "\C-ca" 'org-agenda)

;;Set the MobileOrg
(setq org-mobile-directory "~/Org/gtd/")

;;;;;;;;;;;;;;; Refiling
(setq org-refile-use-outline-path 'file)
;;(setq org-refile-use-outline-path 'full-file-path)
(setq org-refile-targets
      '(("~/Org/Archives/list.org" :maxlevel . 2)
	("~/Org/gtd/trash.org" :maxlevel . 2)
	) )

;(setq org-outline-path-complete-in-steps t)
;(setq org-refile-allow-creating-parent-nodes 'confirm)

;; (use-package grab-mac-link
;;   :ensure t)
;; (use-package org-cliplink
;;   :ensure t)

;; (require 'grab-mac-link)
;; (require 'org-cliplink)

;; (define-key global-map (kbd "C-c l") 'org-store-link)
;; (define-key global-map (kbd "C-c a") 'org-agenda)

(provide 'init-orggtd)
;;;init-orggtd.el ends here


