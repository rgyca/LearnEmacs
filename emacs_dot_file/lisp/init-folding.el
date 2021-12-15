;;; folding minor mode

(use-package folding
  :ensure t)

(load "folding")
(autoload 'folding-mode          "folding" "Folding mode" t)
(autoload 'turn-off-folding-mode "folding" "Folding mode" t)
(autoload 'turn-on-folding-mode  "folding" "Folding mode" t)

(setq folding-default-keys-function
      'folding-bind-outline-compatible-keys)
(folding-add-to-marks-list 'c-mode "/* {{{ " "/* }}} */" " */" t)
(folding-add-to-marks-list 'java-mode "// {{{ " "// }}}" nil t)
(folding-add-to-marks-list 'c++-mode      "//<" "//>" "")
(folding-add-to-marks-list 'LaTeX-mode "%%%{{{" "%%%}}}" " ")
(folding-add-to-marks-list 'latex-mode "%%%{{{" "%%%}}}" " ")
(folding-add-to-marks-list 'latex2e-mode "%%%{{{" "%%%}}}" " ")
(folding-add-to-marks-list 'BibTeX-mode "%%%{{{" "%%%}}}" " ")
(folding-add-to-marks-list 'emacs-lisp-mode ";;;{{{" ";;;}}}" nil)
(folding-add-to-marks-list 'html-mode "<!--{" "<!--}-->" "-->")
(folding-add-to-marks-list 'shell-script-mode "#{{{" "#}}}" nil)
(folding-add-to-marks-list 'sh-mode "#{{{" "#}}}" nil)
(folding-add-to-marks-list 'fortran-mode "c{{{" "c}}}" nil)
(folding-add-to-marks-list 'pascal-mode "//-" "//|" nil)
(folding-add-to-marks-list 'python-mode "#{{{" "#}}}" nil)
(folding-add-to-marks-list 'matlab-mode "%{{{" "%}}}" nil)
(folding-add-to-marks-list 'text-mode "<+---" "---+>" nil)
(folding-add-to-marks-list 'fvwm-mode "#{{{" "#}}}" nil)
(folding-add-to-marks-list 'org-mode "#{{{" "#}}}" nil)
(folding-add-to-marks-list 'scheme-mode ";{{{" ";}}}" nil)
(add-hook 'emacs-lisp-mode-hook 'folding-mode )
(add-hook 'text-mode-hook 'folding-mode )
(add-hook 'scheme-mode-hook 'folding-mode )
(add-hook 'fvwm-mode-hook 'folding-mode )
(add-hook 'pascal-mode-hook 'folding-mode )
(add-hook 'fortran-mode-hook 'folding-mode )

(defun gnu-insert-folding-marks (topic)
  "insert folding makers"
  (interactive "MTopic: ")
  (newline 1)
  (setq elt  (folding-get-mode-marks))
  (insert (nth 0 elt))  ; markers defined for mode
  (insert (concat " " topic))
  (newline 3)
  (insert (nth 1 elt))  ; markers defined for mode
  (forward-line -1)
  )

(provide 'init-folding)
;;; init-folding ends here 
