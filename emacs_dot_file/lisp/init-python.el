;;; Python Mode


(setq py-python-command "python3")
(setq python-shell-interpreter "/usr/local/bin/python3")

(setq  python-indent-guess-indent-offset-verbose nil)


(autoload 'python-mode "python-mode" "Enter python mode." t)
(add-hook 'python-mode-hook 'hl-line-mode
          'folding-mode
          'setnu-mode)


(defun set-pycomint-keywords ()
  (setq font-lock-keywords      python-font-lock-keywords))

(add-hook 'py-shell-hook 'set-pycomint-keywords)

 ;; (defadvice comint-send-input (around block-comint-formatting activate)
 ;;  (if (string= (buffer-name) "*Python*")
 ;;      (letf (((symbol-function 'add-text-properties) (lambda (x y z) nil)))
 ;;        ad-do-it))
 ;;  ad-do-it)

;;====added for run current buffer and shortcut====
(defun python/run-current-file (&optional directory)
  "Execute the current python file."
  (interactive
   (list (or (and current-prefix-arg
                  (read-directory-name "Run in directory: " nil nil t))
             default-directory)))
  (when (buffer-file-name)
    (let* ((command (or (and (boundp 'executable-command) executable-command)
                        (concat "python3 " (buffer-file-name))))
           (default-directory directory)
           (compilation-ask-about-save nil))
      (executable-interpret (read-shell-command "Run: " command)))))
(global-set-key [(control x)(p)] 'python/run-current-file)



;Auto insert the file header      
(add-hook 'find-file-hooks 'auto-insert)
(load-library "autoinsert")
(setq auto-insert-directory "~/.emacs.d/header/")
(setq auto-insert-alist
       (append '((python-mode .  "python-header.py"))
              auto-insert-alist))


(provide 'init-python)
;;;init-python.el ends here
