;;;括号
(use-package smartparens
  :ensure t
  :hook (prog-mode . smartparens-mode)
  :custom
  (sp-escape-quotes-after-insert nil)
  :config
  (require 'smartparens-config))
;;;  (setq smartparens-global-mode t))

(show-paren-mode t)
;; (setq show-paren-style 'expression) ;整个括号内容都加亮

;; (sp-local-pair 'LaTex "\\left(" "\\right)" :insert "C-b l" :trigger "\\l(")

(provide 'init-paren)
;;; init-paren.el ends here
