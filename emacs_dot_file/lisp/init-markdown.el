;;; init-markdown.el --- Markdown support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package markdown-mode
  :ensure t)
(with-eval-after-load 'whitespace-cleanup-mode
  (add-to-list 'whitespace-cleanup-mode-ignore-modes 'markdown-mode))
(setq markdown-command "/usr/local/bin/pandoc")

(provide 'init-markdown)
;;; init-markdown.el ends here
