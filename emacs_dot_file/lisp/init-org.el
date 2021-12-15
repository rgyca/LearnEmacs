;;; Org mode
;;;

;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(use-package org 
  :ensure t
  :pin org)

;;;not work, cdlatex-mode need to re-excute
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

;(setenv "BROWSER" "firefox")

;;;Org bullets makes things look pretty
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; babel stuff
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (emacs-lisp . t)
     (shell . t)
     (C . t)
     (js . t)
     (ditaa . t)
     (dot . t)
     (org . t)
     (latex . t )
     (R . t)
     (ruby . t)
     (ditaa . t)
     (latex . t)
     (plantuml . t)
     )))
(setq org-confirm-babel-evaluate nil) ;;turn off the noisy confirm info.

;;;
(setq org-log-done t)
;; org 自动换行
(add-hook 'org-mode-hook
    (lambda () (setq truncate-lines nil)))

;; SRC Code Highlight
(setq org-src-fontify-natively t)

;;   set the fonts Highlight
(defface hi-green-b '((t (:foreground "#00FF00"))) t)
(defun org-bold-highlight ()
  (interactive)
  ;(hi-lock-mode)
  (highlight-regexp "[ \\t]\\(\\*\\(\\S-[^*]+\\S-\\|[^*]\\{1,2\\}\\)\\*\\)[ \\t\\n]*" 'hi-green-b)
  )
(add-hook 'org-mode-hook 'org-bold-highlight)


;;   Set the level font size
(set-face-attribute 'org-level-1 nil :height 1.3 :bold t)
(set-face-attribute 'org-level-2 nil :height 1.2 :bold t)
(set-face-attribute 'org-level-3 nil :height 1.1 :bold t)

;Auto insert the file header      
(add-hook 'find-file-hooks 'auto-insert)
(load-library "autoinsert")
(setq auto-insert-directory "~/.emacs.d/header/")
(setq auto-insert-alist
      (append '((org-mode .  "org-header.org"))
               auto-insert-alist))
       
(setq org-latex-create-formula-image-program 'dvipng)
(setq org-latex-packages-alist nil)
(setq org-preview-latex-default-process 'dvipng)


;;;修改 preview公式预览的大小
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

;;; Show and highlight latex insertion code block
(setq org-highlight-latex-and-related '(native))

(provide 'init-org)
;;; init-org.el ends here
