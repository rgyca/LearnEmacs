;;; Octave

(autoload 'run-octave "octave-inf" nil t)
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

;; ;Auto insert the file header      
(add-hook 'find-file-hooks 'auto-insert)
(load-library "autoinsert")
(setq auto-insert-directory "~/.emacs.d/header/")
(setq auto-insert-alist
       (append '((octave-mode .  "matlab-header.m"))
              auto-insert-alist))

(use-package ac-octave
  :ensure t)

(add-hook 'octave-mode-hook
          '(lambda () (ac-octave-setup)))

(provide 'init-octave)

;;;init-octave ends here
