;;;auctex cdlatex


;;;Auctex-mode + CDLatex

;; latex
(use-package tex
  :ensure auctex)

(use-package tex
  :ensure cdlatex)

(require 'cdlatex)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'LateX-mode-hook 'turn-on-cdlatex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq cdlatex-paired-parens "$[{(<")


(add-hook 'LaTeX-mode-hook (lambda ()
                              (TeX-fold-mode 1)))
(add-hook 'LaTeX-mode-hook #'outline-minor-mode)

;; (setq-default TeX-engine 'default)
(setq-default TeX-master 'xelatex)
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)                  ;自动保存
(setq TeX-parse-self t)                 ;解析


;;(setq TeX-show-compilation t) ;;shutoff compilation buffer
;;(setq TeX-recenter-output-buffer nil)

(add-hook 'LaTeX-mode-hook (lambda()
                             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1 %(mode)%' %t" TeX-run-TeX nil t))
                              (setq TeX-command-default "XeLaTeX")
                              (setq TeX-save-query  nil )
                              (setq TeX-show-compilation nil) ;;t=>nil
                              ))

;;set view
;; (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
;; (setq TeX-view-program-list
;;       '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;; to use pdfview with auctex
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t) ;; not sure if last line is neccessary
;; to have the buffer refresh after compilation
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

;;make org=>pdf (c-c c-e l o) Opened by the pdfview
(push '("\\.pdf\\'" . emacs) org-file-apps)

;;; Synctex
;; (setq TeX-source-correlate-method
;;       '((dvi . source-specials)
;;        (pdf . synctex)))

(custom-set-variables
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t))

(setq reftex-plug-into-AUCTeX t)



;Auto insert the file header      
(add-hook 'find-file-hooks 'auto-insert)
(load-library "autoinsert")
(setq auto-insert-directory "~/.emacs.d/header/")
(setq auto-insert-alist
       (append '((LaTex-mode .  "latex-header.tex"))
              auto-insert-alist))


(provide 'init-auctex)

;;; init-auctex.el ends here
