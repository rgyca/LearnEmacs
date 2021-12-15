;;;  init-ivyposframe.el


;; (use-package posframe
;;   :ensure t )

(use-package ivy-posframe
  :ensure t
  :config
  (setq ivy-posframe-height-alist '((swiper . 20)
                                    (t      . 25)))
;;  (setq ivy-posframe-min-width 50)
  (setq ivy-posframe-font  "Courier")
;;  (set-face-attribute 'ivy-posframe nil :background "DarkSlateGrey" :foreground "Grey");"#f74f4f");"#87af5f" );"#330000")
  (set-face-attribute 'ivy-posframe nil :background "#1f1f1f" :foreground "#7fAf7f");"#f74f4f");"#87af5f" );"#330000")
  :custom
  (ivy-display-function #'ivy-posframe-display-at-frame-center)
  (ivy-posframe-parameters
   '((left-fringe . 5)
     (right-fringe . 5)))
  (ivy-posframe-mode 1)
  )

(provide 'init-ivyposframe)
;; init-ivypostframe.el ends here
