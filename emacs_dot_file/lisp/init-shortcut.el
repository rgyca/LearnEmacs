;;; init-shortcut.el ---

(global-set-key [f1] 'find-file)        ;;F1 open
(global-set-key [f2] 'save-buffer)      ;;F2 save
(global-set-key [f3] 'eshell)           ;;F3 eshell
(global-set-key [(control f3)] 'ido-dired)
(global-set-key [f4] 'kill-this-buffer) ;;F4 kill buffer
(global-set-key [f5] 'undo)              ;; F5 undo

(global-set-key [(control f5)] 'redo)        ;; C-F5 redo
(global-set-key [M-S-f5] 'revert-buffer)     ;; M-S-F5 Revert
(global-set-key [f7] 'calendar)              ;; F7 calendar
(global-set-key [f8] 'other-window)          ;; F8 other-window
(global-set-key [(control f8)] 'speedbar-get-focus)
(global-set-key [f9] 'indent-region)         ;; F9 indent-region
(global-set-key [(control f9)] 'man-follow)  ;; C-F9 man-follow
(global-set-key [f10] 'todo-show)            ;; F10 todo-show
(global-set-key [f11] (function (lambda () (interactive)
                                  (switch-to-buffer "*scratch*")(text-mode))))

(global-unset-key "\M-.")
(global-set-key [(meta M)] 'matlab-shell)
(global-set-key [(meta O)] 'run-octave)
(global-set-key [(meta I)] 'imaxima)

(global-set-key "\C-x\C-c" 'kill-emacs)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-#"     'query-replace-regexp)
(global-set-key "\C-z" 'set-mark-command)
(global-set-key "\C-c\C-z" 'pop-global-mark)
(global-set-key "\C-ck" 'browse-kill-ring)
(global-set-key "\C-xk" 'kill-buffer-and-window)
(global-set-key "\C-c\C-v" 'view-mode)
(add-hook 'view-mode-hook (function (lambda () (interactive)
                           (local-set-key "f" 'View-scroll-line-forward) )))

(global-set-key "\M-o" 'other-window)


(global-set-key "\C-cp" 'pdf-view-mode)

(global-set-key "\C-cd" 'dashboard-refresh-buffer)

;;due to \C-c! used by flycheck
(org-defkey org-mode-map "\C-c@" 'org-time-stamp-inactive)
;;chang the fonts size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)

;; 扩大或者缩小窗口（上下）,Ctrl+><
(global-set-key (kbd "C->") 'enlarge-window)
(global-set-key (kbd "C-<") 'shrink-window)
;; 扩大或者缩小窗口（左右）,Ctrl+{}
(global-set-key (kbd "C-{") 'enlarge-window-horizontally)
(global-set-key (kbd "C-}") 'shrink-window-horizontally)



(provide 'init-shortcut)
;;init-shortcut
;; Author: zhou <zhou@MNO.local>
;; Keywords: lisp, abbrev, abbrev, abbrev, 
