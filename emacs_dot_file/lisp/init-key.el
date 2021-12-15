;;; init-key.el --- Set up exec-path to help Emacs find programs  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;;; try
(use-package try
  :ensure t)

;; posframe
(use-package posframe
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(global-set-key "\C-z" 'set-mark-command)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)

;;; recent file
(recentf-mode 1)

(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;;Swiper / Ivy / Counsel
(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper-isearch)
	 ("C-r" . swiper-isearch)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-r" . counsel-recentf)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
   (setq ivy-use-virtual-buffers t)
   (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;;;Avy - navigate by searching for a letter on the screen and jumping to it
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-word-1)) ;; changed from char as per jcs

;;;Ace windows for easy window switching
(use-package ace-window
  :ensure t
  :init
  (progn
    (setq aw-scope 'global) ;; was frame
    (global-set-key (kbd "C-x O") 'other-frame)
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
    ))

;;; Misc packages

;; flashes the cursor's line when you scroll
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  (setq beacon-color "#666600")
  )

;; deletes all the whitespace when you hit backspace or delete
;; ;;;;I am not used to this kind of operation, maybe somedays to get used to it.
(use-package hungry-delete
  :ensure t
  :config
  (progn
    (setq hungry-delete-join-reluctantly t)
    (global-hungry-delete-mode)))

;;;;;;;;;Not used
;; (use-package multiple-cursors
;;   :ensure t)

;; (setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000)
;; (setq track-eol t)

(provide 'init-key)

;;;init-key.el ends here


