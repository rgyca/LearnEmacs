;;; init-markdown.el --- Markdown support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;emmet模式                                                                                                                              
;; (use-package emmet-mode
;;   :ensure t)

;; (add-hook 'sgml-mode-hook 'emmet-mode)                                                                                                   
;; (add-hook 'css-mode-hook  'emmet-mode)                                                                                                   
;; (add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))                                                           
;; (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 4))) ;; indent 4 spaces.                                                   

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "~/pandoc -t html5")
  )

;; For real time preview in a browser. 
(use-package simple-httpd
  :ensure t
  :config
  (setq httpd-port 7070)
  (setq httpd-host (system-name)))

(use-package impatient-mode
  :ensure t
  :commands impatient-mode)

(defun markdown-filter (buffer)
  (princ
   (with-temp-buffer
     (let ((tmp (buffer-name)))
       (set-buffer buffer)
       (set-buffer (markdown tmp))
       (format "<!DOCTYPE html><html><title>Markdown preview</title><link rel=\"stylesheet\" href = \"https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.min.css\"/>
<body><article class=\"markdown-body\" style=\"box-sizing: border-box;min-width: 200px;max-width: 980px;margin: 0 auto;padding: 45px;\">%s</article></body></html>" (buffer-string))))
   (current-buffer)))

(defun markdown-live-preview ()
  "Preview markdown."
  (interactive)
  (unless (process-status "httpd")
    (httpd-start))
  (impatient-mode)
  (imp-set-user-filter 'markdown-filter)
  (imp-visit-buffer))

(global-set-key "\C-cm" 'markdown-live-preview)

(provide 'init-markdown)
;;; init-markdown.el ends here
