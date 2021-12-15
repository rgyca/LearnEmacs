;;; init-orgroam.el ---                              -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
;; Org-Roam basic configuration

(setq org-roam-dir "~/Org/roam")

(use-package org-roam
  :ensure t
  :init (setq org-roam-v2-ack t) ;; Acknowledge V2 upgrade
  :custom
  (org-roam-directory (file-truename org-roam-dir))
  (org-roam-complete-everywhere t)
  (org-roam-dailies-capture-templates
   '(("d" "default" entry "* %<%I:%M %p>\n  %?"
      :if-new(file+head "%<%Y-%m-%d>.org" "#+title:%<%y-%m-%d>\n\n"))

     ("k" "kids" entry "* %<%Y年%m月%d日 星期(%3a)】 %H:%M>\n  %?"
      :target (file+head "./../kids/Story_Of_Kids.org" "#+title:%<%y-%m-%d>\n"))
     ))

  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "default/%<%Y%m%d%H%M%S>-${slug}.org"
			 "#+title: ${title}\n#+date: %u\n\n")
      :unnarrowed t)

     ("w" "work" plain "%?"
      :if-new (file+head "work/W%<%Y%m%d%H%M%S>-${slug}.org"
			 "#+title: ${title}\n#+date: %u\n\n")
      :unnarrowed t)

     ("t" "thought" plain
      (file "~/Org/roam/templates/thought.org")
      :if-new (file+head "thoughts/T%<%Y%m%d%H%M%S>-${slug}.org"
			 "#+title: ${title}\n#+date: %u\n\n")
      :unnarrowed t)
     ("b" "book reading" plain
      (file "~/Org/roam/templates/book.org")
      :target (file+head "book/B%<%Y%m%d%H%M%S>-${slug}.org"
			 "#+title: ${title}\n")
      :unnarrowed t)

     ;; ("p" "project" plain
     ;;  ("* Goals \n\n%?\n\n* Tasks\n\n** TODO Add inital tasks\n\n* Dates)\n\n"
     ;;  :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
     ;; 			 "#+title: ${title}\n#+filetages:Project")
     ;;  :unnarrowed t)
     ))
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n l" . org-roam-buffer-toggle)
	 :map org-mode-map
	 ("C-M-i" . completion-at-point)
	 :map org-roam-dailies-map
	 ("Y" . org-roam-dailies-capture-yesterday)
	 ("T" . org-roam-dailies-capture-tommorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (org-roam-setup)
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode))

(use-package org-roam-ui
  :ensure t
  :init
  (setq org-roam-ui-sync-theme t)
  (setq org-roam-ui-follow t)
  (setq org-roam-ui-update-on-save t)
  (setq org-roam-ui-open-on-start nil)
  :custom
  (org-roam-db-sync)
  :after org-roam
  :hook (org-roam . org-roam-ui-mode)
  :bind
  (("C-c n g" . org-roam-ui-open)))

;; (use-package deft
;;   :ensure t
;;   :config
;;   (setq deft-directory org-directory
;;         deft-recursive t
;;         deft-strip-summary-regexp ":PROPERTIES:\n\\(.+\n\\)+:END:\n"
;;         deft-use-filename-as-title t)
;;   :bind
;;   ("C-c n w" . deft))


(provide 'init-orgroam)
;;; init-orgroam.el ends here
