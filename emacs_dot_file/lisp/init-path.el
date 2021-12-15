;;;Setting the exec path
(setenv "PATH"
        (concat ":/usr/local/bin:/usr/bin:/usr/local/texlive/2021/bin/universal-darwin:/opt/local/bin"
                (getenv "PATH")))

(setq exec-path
      (append '("/usr/local/texlive/2021/bin/universal-darwin/"
                "/usr/bin/"
                "/usr/local/bin/"
		"/opt/local/bin/"
		"/opt/local/var/macports/software/")
      exec-path))

(provide 'init-path)
;;; init-path.el ends here 
