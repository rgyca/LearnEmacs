;;; init.el --- Set up exec-path to help Emacs find programs  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq max-lisp-eval-depth 10000)
(setq max-specpdl-size 10000)
(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives
      '(("org" . "http://elpa.emacs-china.org/org/")
	("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
	;; ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
	;; ("melpa" . "https://melpa.org/packages/")
	("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
	))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(push "~/.emacs.d/elisp/" load-path)

;;   设置可执行文件的路径

(require 'init-path)

;;   设置toolbar,scroll,fonts
(require 'init-face)

;;  开始的时候方便操作 try,which-key,set mark, swiper
(require 'init-key)

;; 设置folding
;;(require 'init-folding)

;;   设置背景颜色和powerline
(require 'init-theme)

;;   定义后缀和模式关联
(require 'init-mode)

;; sr-speedbar command+s
(require 'init-speedbar)

;;   设置自动补全company,jedi-python
(require 'init-company)

;;   设置时间戳
(require 'init-timestamp)

(require 'init-flycheck)
(require 'init-ibuffer)
(require 'init-dired)
(require 'init-paren)

(require 'init-org)
(require 'init-orggtd)
(require 'init-orgexport)
(require 'init-orgroam)

(require 'init-python)
(require 'init-imaxima)
(require 'init-octave)
(require 'init-auctex)
(require 'init-eshell)
(require 'init-dictionary)
(require 'init-markdown)

;;(require 'init-docview)
(require 'init-pdfview)
(require 'init-myinit)

(require 'init-dashboard)
(require 'init-ivyposframe)

(require 'init-shortcut)
;;(require 'init-eaf)
(require 'init-git)

;;(require 'init-mu4e)

(provide 'init)
