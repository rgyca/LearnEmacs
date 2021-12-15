;;; init-face
(setq inhibit-startup-message t) ;;关系启动初始画面
(tool-bar-mode -1)  ;;关闭工具、菜单、滚动条、行号
(menu-bar-mode 1)
(scroll-bar-mode -1)
(global-linum-mode -1)

(delete-selection-mode t)

;; all backups goto ~/.backups instead in the current directory
(setq make-backup-files nil)
(setq backup-directory-alist (quote (("." . "~/Temp/.emacs-backups"))))

(setq visible-bell t)
(electric-indent-mode 1)
(mouse-avoidance-mode 'animate)
(setq split-width-threshold 0)

;; Highlights the current cursor line
(global-hl-line-mode t)

;;Maximized the windows
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;; 在modeline上显示光标行列号
(setq column-number-mode t)
(setq line-number-mode t)


;;在标题栏上显示路径
(setq frame-title-format 
     '(buffer-file-name "%b - %f" ; File buffer 
     (dired-directory dired-directory ; Dired buffer 
     (revert-buffer-function "%b" ; Buffer Menu 
      ("%b - Dir: " default-directory))))) ; Plain buffer 

;;;setting the mouse and the cursor 
(setq-default  default-frame-alist
               `(;; (vertical-scroll-bars . right)
		 (cursor-height . 4)        ; height
		 (cursor-type . (bar . 2)) ;set cursor 3 pixels width
					;box, bar, caret, hairline-caret, checkered-caret
		 (cursor-color . "red")
		 (mouse-color  . "Orchid")
		 ;; (width . 80)
		 ;; (height . 40)
		 ))

;; ;;; setting fonts for English and Chinese
(set-face-attribute 'default nil :height 150 :family "Courier New" )
(set-frame-font "-outline-Courier New-normal-normal-normal-mono-15-*-*-*-c-*-iso8859-1")
(set-fontset-font (frame-parameter nil 'font)
		  'han (font-spec :family "SimSun" :size 15))

;;; Transparency
(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha))) 100)
         '(85 . 75) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

(provide 'init-face)
;;; init-face.el ends here
