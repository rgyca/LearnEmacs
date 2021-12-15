;;;DIRED

(setq dired-recursive-deletes t) ; 可以递归的删除目录
(setq dired-recursive-copies t) ; 可以递归的进行拷贝
(require 'dired-x) ; 有些特殊的功能
(global-set-key "\C-x\C-j" 'dired-jump) ; 通过 C-x C-j 跳转到当前目录的 Dired

(setq dired-guess-shell-alist-user
(list "\\.pdf$" "skim")
)

(setq dired-dwim-target t)
(use-package dired-narrow
  :ensure t
  :config
  (bind-key "C-c C-n" #'dired-narrow)
  (bind-key "C-c C-f" #'dired-narrow-fuzzy)
  (bind-key "C-x C-N" #'dired-narrow-regexp)
  )

(use-package dired-subtree :ensure t
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))


;;; Preview image
(define-key dired-mode-map (kbd "C-t C-d") 'image-dired)

(provide 'init-dired)
;;;init-dired ends here
