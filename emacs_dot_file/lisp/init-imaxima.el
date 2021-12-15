;;; init-imaxima.el --- maxima                       -*- lexical-binding: t; -*-

;; for MacPorts users
(setq temporary-file-directory "~/Temp/Imaxima")
;; for tex, ghostscript, gnuplot, and Maxima
(push "/opt/local/bin" exec-path)
(push "/usr/bin" exec-path)

(setenv "PATH"
        (concat "/opt/local/bin:/usr/bin/"
                (getenv "PATH") ))
(setq imaxima-maxima-program "maxima")
;; for imaxima

(autoload 'imaxima "imaxima" "Maxima frontend" t)
(autoload 'imath-mode "imath" "Interactive Math mode" t)

(setq auto-mode-alist (cons '("\\.max" . maxima-mode) auto-mode-alist))

(setq imaxima-use-maxima-mode-flag t)

(setq maxima-use-dynamic-complete t)
(setq imaxima-fnt-size "Large")
(setq imaxima-scale-factor 1.2)
(setq imaxima-label-color "red")
(setq imaxima-equation-color "green")
(setq imaxima-max-scale 0.5)
(setq imaxima-linearize-flag t)


(provide 'init-imaxima)
;;;init-imaxima ends here
